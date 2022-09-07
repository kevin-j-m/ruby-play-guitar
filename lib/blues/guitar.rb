# frozen_string_literal: true

module Blues
  class Guitar
    attr_reader :strings

    def initialize(amplifier: nil)
      @strings = Array.new(6) { |i| GuitarString.new(number: i + 1) }
      @amplifier = amplifier
    end

    def pick(string:, fret:)
      positioning = FingerPosition.new(
        string: @strings[string - 1],
        fret: fret,
      )

      if @amplifier
        @amplifier.amplify(positioning.note)
      else
        positioning
      end
    end

    def tune(tuning = :standard)
      Tuner.new(self).tune(tuning)
    end

    def restring(gauge_set:)
      @strings = Array.new(6) do |i|
        GuitarString.new(
          number: i + 1,
          gauge_set: gauge_set,
        )
      end
    end
  end
end
