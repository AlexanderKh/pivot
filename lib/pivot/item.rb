module Pivot
  class Item
    VALID_PROJECT_CODES = %w[EREC AZR].freeze

    attr_reader :name, :points, :assignee
    attr_writer :assignee

    def initialize(name:, assignee: nil, points: nil)
      @name = name
      @assignee = assignee
      @points = points
    end

    def +(other)
      @points + other.points
    end

    def project_code
      @name.split('-').first
    end

    def valid?
      VALID_PROJECT_CODES.include? project_code
    end

    def ==(other)
      @name == other.name
    end
  end
end
