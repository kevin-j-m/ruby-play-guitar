# frozen_string_literal: true

module Blues
  class StringGauge
    VALID_SETS = [:nine, :eleven, :srv].freeze

    def initialize(set)
      @set = set
    end

    def [](index)
      raise "unknown string gauge set" unless VALID_SETS.include?(@set)

      send(@set)[index]
    end

    private

    def nine
      {
        1 => 9,
        2 => 11,
        3 => 16,
        4 => 24,
        5 => 32,
        6 => 42,
      }
    end

    def eleven
      {
        1 => 11,
        2 => 14,
        3 => 18,
        4 => 28,
        5 => 38,
        6 => 48,
       }
    end

    def srv
      {
        1 => 13,
        2 => 15,
        3 => 19,
        4 => 28,
        5 => 38,
        6 => 58,
      }
    end
  end
end
