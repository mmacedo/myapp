require 'spec_helper'

describe Election do

  it "should have a valid factory" do
    build_stubbed(:election).should be_valid
  end

  describe "timestamps" do

    let(:election) { create(:election) }

    it "should have an updated_at attribute" do
      election.should respond_to(:updated_at)
      election.updated_at.should be_a_kind_of Time
    end

    it "should have a created_at attribute" do
      election.should respond_to(:created_at)
      election.created_at.should be_a_kind_of Time
    end

  end

  describe "area" do

    it "should require an area" do
      build_stubbed(:election, area: nil).should_not be_valid
    end

  end

  describe "post" do

    it "should require a post name" do
      build_stubbed(:election, post: "").should_not be_valid
    end

    it "should reject one letter post names" do
      build_stubbed(:election, post: "a").should_not be_valid
    end

    it "should accept valid post names" do
      build_stubbed(:election, post: "President").should be_valid
    end

  end

  describe "election day" do

    it "should require an election day" do
      election = build_stubbed(:election, election_end: nil)
      election.should_not be_valid
    end

    it "should require the start date be less than or equal the end date" do
      election_end = Time.now.beginning_of_day.advance(days:30)
      election_start = election_end.advance(days:1)
      election = build_stubbed(:election,
                                            election_start: election_start,
                                            election_end: election_end)
      election.should_not be_valid
    end

  end

end
