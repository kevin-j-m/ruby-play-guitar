# frozen_string_literal: true

module Blues
  class Guitar
    attr_reader :strings

    def initialize(tuning: :standard)
      @tuning = tuning
      @strings = Array.new(6) { Guitar::String.new }
    end

    def pick(string:, fret:)
      @strings[string - 1].pluck(fret: fret)
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
      @strings[0].tune(:e)
      @strings[1].tune(:a)
      @strings[2].tune(:d)
      @strings[3].tune(:g)
      @strings[4].tune(:b)
      @strings[5].tune(:e)
    end
  end
end
