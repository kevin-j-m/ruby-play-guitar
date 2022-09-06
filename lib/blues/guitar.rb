# frozen_string_literal: true

module Blues
  class Guitar
    VALID_TUNINGS = [:down_half_step, :standard].freeze

    attr_reader :strings

    def initialize
      @tuning = nil
      @strings = Array.new(6) { |i| GuitarString.new(number: i + 1) }
    end

    def pick(string:, fret:)
      FingerPosition.new(
        string: @strings[string - 1],
        fret: fret,
      )
    end

    def tune(tuning = :standard)
      raise "unknown tuning" unless VALID_TUNINGS.include?(tuning)
      @tuning = tuning

      send("#{@tuning}_tuning")

      @tuning
    end

    def restring(gauge_set:)
      @strings = Array.new(6) do |i|
        GuitarString.new(
          number: i + 1,
          gauge_set: gauge_set,
        )
      end
    end

    private

    def standard_tuning
      @strings[5].tune(:e)
      @strings[4].tune(:a)
      @strings[3].tune(:d)
      @strings[2].tune(:g)
      @strings[1].tune(:b)
      @strings[0].tune(:e)
    end

    def down_half_step_tuning
      @strings[5].tune(:e_flat)
      @strings[4].tune(:a_flat)
      @strings[3].tune(:d_flat)
      @strings[2].tune(:g_flat)
      @strings[1].tune(:b_flat)
      @strings[0].tune(:e_flat)
    end
  end
end
