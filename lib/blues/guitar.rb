# frozen_string_literal: true

module Blues
  class Guitar
    VALID_TUNINGS = [:down_half_step, :standard].freeze

    attr_reader :strings

    def initialize(amplifier: nil)
      @tuning = nil
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
      case tuning
      when :standard
        standard_tuning
      when :down_half_step
        down_half_step_tuning
      when :drop_d
        drop_d_tuning
      when :open_a
        open_a_tuning
      when :modal_c
        modal_c_tuning
      when :all_fourths
        all_fourths_tuning
      when :all_fifths
        all_fifths_tuning
      else
        raise "unknown tuning"
      end

      @tuning = tuning
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

    def drop_d_tuning = nil
    def open_a_tuning = nil
    def modal_c_tuning = nil
    def all_fourths_tuning = nil
    def all_fifths_tuning = nil
  end
end
