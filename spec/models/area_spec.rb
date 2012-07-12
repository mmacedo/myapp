require 'spec_helper'

describe Area do

  it "should have a valid factory" do
    build_stubbed(:area).should be_valid
  end

  describe "timestamps" do

    let(:area) { create(:area) }

    it "should have an updated_at attribute" do
      area.should respond_to(:updated_at)
      area.updated_at.should be_a_kind_of Time
    end

    it "should have a created_at attribute" do
      area.should respond_to(:created_at)
      area.created_at.should be_a_kind_of Time
    end

  end

  describe "name" do

    it "should require a name" do
      build_stubbed(:area, name: "").should_not be_valid
    end

    it "should reject one letter names" do
      build_stubbed(:area, name: "a").should_not be_valid
    end

    it "should accept valid names" do
      build_stubbed(:area, name: "us").should be_valid
    end

  end

  describe "type" do

    it "should require a type" do
      build_stubbed(:area, type: "").should_not be_valid
    end

  end

end
