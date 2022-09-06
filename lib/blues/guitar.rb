# frozen_string_literal: true

module Blues
  class Guitar
    attr_reader :strings

    def initialize(tuning: :standard)
      @tuning = tuning
      @strings = Array.new(6) { |i| Guitar::String.new(number: i + 1) }
    end

    def pick(string:, fret:)
      FingerPosition.new(
        string: @strings[string - 1],
        fret: fret,
      )
    end

    def tune(tuning = nil)
      if tuning
        @tuning = tuning
      end

      if @tuning == :standard
        standard_tuning
      end

      tuning
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
  end
end
