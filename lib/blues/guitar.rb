# frozen_string_literal: true

module Blues
  class Guitar
    attr_reader :strings

    def initialize(tuning: :standard)
      @tuning = tuning
      @strings = [nil, nil, nil, nil, nil, nil]
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
      @strings[0] = :e
      @strings[1] = :a
      @strings[2] = :d
      @strings[3] = :g
      @strings[4] = :b
      @strings[5] = :e
    end
  end
end
