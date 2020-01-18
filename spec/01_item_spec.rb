require 'spec_helper'

RSpec.describe Pivot::Item do

  let(:item) { Pivot::Item.new(name: "EREC-10", assignee: "smith@example.com", points: 2) }
  let(:another_item) { Pivot::Item.new(name: "EREC-22", assignee: "johndough@example.com", points: 5) }
  let(:third_item) { Pivot::Item.new(name: "AZR-1", assignee: "johndough@example.com", points: 2) }
  let(:some_item) { Pivot::Item.new(name: "CHOOCHOO-1", assignee: "hackersaurus@example.com", points: 2) }

  describe "#name" do
    it "gets the name" do
      expect(item.name).to eq("EREC-10")
    end
  end

  describe "#assignee" do
    it "gets the assignee" do
      expect(item.assignee).to eq("smith@example.com")
    end
  end

  describe "#points" do
    it "it gets the points" do
      expect(item.points).to eq(2)
    end
  end

  describe "#+" do
    it "adds the item's points" do
      expect(item + another_item).to eq(7)
    end
  end

  describe "#project_code" do
    it "extracts the project code from the item name" do
      expect(item.project_code).to eq('EREC')
    end

    it "extracts the project code from the item name (AZR)" do
      expect(third_item.project_code).to eq('AZR')
    end
  end

  describe "#valid?" do
    it "returns true if the project code is EREC" do
      expect(item).to be_valid
    end

    it "returns true if the project code is AZR" do
      expect(item).to be_valid
    end

    it "returns false if the project code something else" do
      expect(some_item).not_to be_valid
    end
  end

end