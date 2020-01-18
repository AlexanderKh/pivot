require 'spec_helper'

RSpec.describe Pivot::Person do
  let(:person) { Pivot::Person.new(email: "johndough@example.com", first_name: "John", last_name: "Dough") }
  let(:item) { Pivot::Item.new(name: "EREC-10", points: 2) }
  let(:logger) { Pivot::Logger.new($stdout) }

  describe "#email" do
    it "it gets the email of the person" do
      expect(person.email).to eq("johndough@example.com")
    end
  end

  describe "#first_name" do
    it "gets the first name of the person" do
      expect(person.first_name).to eq("John")
    end
  end

  describe "#last_name" do
    it "gets the last name of the person" do
      expect(person.last_name).to eq("Dough")
    end
  end

  describe "#add_item" do

    it "can add an item to the person" do
      person.add_item(item)
      expect(person.items.first).to eq(item)
    end

    it "automatically assigns the person to the item" do
      person.add_item(item)
      expect(item.assignee).to eq("johndough@example.com")
    end

    it "should be able to optionally log the event via a block" do
      expect(logger).to receive(:info).with("item added").and_return(true)

      person.add_item(item) { logger.info "item added" }
    end
  end

end