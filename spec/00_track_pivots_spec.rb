require 'spec_helper'

RSpec.describe Pivot::Tracker do

  let(:items) do
    [
      { name: "EREC-10", assignee: 'smith@example.com', points: 2 },
      { name: "EREC-21", assignee: 'johndough@example.com',  points: 4},
      { name: "EREC-32", assignee: 'cesar@example.com',  points: 3},
      { name: "EREC-11", assignee: 'bruno@example.com', points: 5 },
      { name: "EREC-12", assignee: 'cesar@example.com',  points: 3},
      { name: "EREC-13", assignee: 'genericman@example.com', points: 2},
      { name: "EREC-14", assignee: 'johndough@example.com',  points: 1}
    ]
  end

  describe ".count" do
    it "counts the number of items available for pivot" do
      expect(Pivot::Tracker.count(items)).to eq(7)
    end
  end

  describe ".item_for" do
    it "finds the item for johndough@example.com" do
      item = Pivot::Tracker.item_for(items, 'johndough@example.com')
      expect(item[:name]).to eq("EREC-14")
    end
  end

  describe ".pivoted?" do
    it "checks if cesar@example.com is on the list of people that pivoted" do
      expect(Pivot::Tracker.pivoted?(items, "cesar@example.com")).to be true
    end

    it "checks if johnyyhair@example.com is on the list of people that pivoted" do
      expect(Pivot::Tracker.pivoted?(items, "johnyyhair@example.com")).to be false
    end
  end

  describe ".total_points" do
    it "sums the total of points that was pivoted" do
      expect(Pivot::Tracker.total_points(items)).to eq(13)
    end

    it "sums the total points that an assignee pivoted" do
      expect(Pivot::Tracker.total_points(items, assignee: 'johndough@example.com')).to eq(5)
    end
  end

  describe ".unique_assignees" do
    it "gets the unique assignee emails tbat pivoted" do
      unique_assignees = Pivot::Tracker.unique_assignees(items)

      expect(unique_assignees.count).to eq(5)
    end
  end

end