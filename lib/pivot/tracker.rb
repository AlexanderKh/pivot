module Pivot
  class Tracker
    def self.count(items)
      items.length
    end

    def self.item_for(items, assignee)
      items.reverse.detect { |item| item[:assignee] == assignee }
    end

    def self.pivoted?(items, assignee)
      !!items.detect { |item| item[:assignee] == assignee }
    end

    def self.total_points(items, assignee: nil)
      selected_items = assignee ? items.filter { |item| item[:assignee] == assignee } : items

      selected_items.reduce(0) { |sum, item| sum + item[:points] }
    end

    def self.unique_assignees(items)
      items.uniq { |item| item[:assignee] }
    end
  end
end
