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
      @strings[5].tune(note: :e, octave: 2)
      @strings[4].tune(note: :a, octave: 2)
      @strings[3].tune(note: :d, octave: 3)
      @strings[2].tune(note: :g, octave: 3)
      @strings[1].tune(note: :b, octave: 3)
      @strings[0].tune(note: :e, octave: 4)
    end

    def down_half_step_tuning
      @strings[5].tune(note: :e_flat, octave: 2)
      @strings[4].tune(note: :a_flat, octave: 2)
      @strings[3].tune(note: :d_flat, octave: 3)
      @strings[2].tune(note: :g_flat, octave: 3)
      @strings[1].tune(note: :b_flat, octave: 3)
      @strings[0].tune(note: :e_flat, octave: 4)
    end
  end
end
