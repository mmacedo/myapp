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

    it "should reject duplicate names" do
      create(:area, name: 'us')
      build_stubbed(:area, name: 'us').should_not be_valid
    end

    it "should reject same name with different case" do
      create(:area, name: 'us')
      build_stubbed(:area, name: 'US').should_not be_valid
    end

    it "should accept duplicate names with different parents" do
      us = create(:area, name: 'us')
      br = create(:area, name: 'br')
      create(:area, name: 'sc', parent: us)
      build_stubbed(:area, name: 'sc', parent: br).should be_valid
    end

  end

  describe "type" do

    it "should require a type" do
      build_stubbed(:area, type: "").should_not be_valid
    end

  end

  describe "parent" do

    it "should not allow to be parent of itself" do
      area = create(:area)
      area.parent = area
      area.should_not be_valid
    end

    it "should not allow to create circular reference" do
      area1 = create(:area)
      area2 = create(:area, parent: area1)
      area3 = create(:area, parent: area2)
      area1.parent = area3
      area1.should_not be_valid
    end

    it "should not allow area nesting deeper than 20 levels" do
      parent = create(:area)
      (2..20).each do
        parent = create(:area, parent: parent)
      end
      # 21st level
      build_stubbed(:area, parent: parent).should_not be_valid
    end

  end

end
