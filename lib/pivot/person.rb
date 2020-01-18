module Pivot
  class Person
    attr_reader :email, :first_name, :last_name, :items

    def initialize(email:, first_name:, last_name:)
      @email = email
      @first_name = first_name
      @last_name = last_name
      @items = []
    end

    def add_item(item, &block)
      @items.push item
      item.assignee = @email

      block && yield
    end
  end
end
