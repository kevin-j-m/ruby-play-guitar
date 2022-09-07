# frozen_string_literal: true

module Blues
  class Tuner
    VALID_TUNINGS = [
      :all_fifths,
      :all_fourths,
      :down_half_step,
      :drop_d,
      :modal_c,
      :open_a,
      :standard,
    ].freeze

    def initialize(guitar)
      @guitar = guitar
    end

    def tune(tuning = :standard)
      raise "unknown tuning" unless VALID_TUNINGS.include?(tuning)

      send("#{tuning}_tuning")
    end

    private

    def standard_tuning
      @guitar.strings[5].tune(note: :e, octave: 2)
      @guitar.strings[4].tune(note: :a, octave: 2)
      @guitar.strings[3].tune(note: :d, octave: 3)
      @guitar.strings[2].tune(note: :g, octave: 3)
      @guitar.strings[1].tune(note: :b, octave: 3)
      @guitar.strings[0].tune(note: :e, octave: 4)
    end

    def down_half_step_tuning
      @guitar.strings[5].tune(note: :e_flat, octave: 2)
      @guitar.strings[4].tune(note: :a_flat, octave: 2)
      @guitar.strings[3].tune(note: :d_flat, octave: 3)
      @guitar.strings[2].tune(note: :g_flat, octave: 3)
      @guitar.strings[1].tune(note: :b_flat, octave: 3)
      @guitar.strings[0].tune(note: :e_flat, octave: 4)
    end

    def drop_d_tuning = nil
    def open_a_tuning = nil
    def modal_c_tuning = nil
    def all_fourths_tuning = nil
    def all_fifths_tuning = nil
  end
end
