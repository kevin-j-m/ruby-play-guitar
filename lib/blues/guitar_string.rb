# frozen_string_literal: true

module Blues
  class GuitarString
    attr_reader :number,
      :tuning_note

    def initialize(number:, gauge_set: :nine)
      @number = number
      @gauge_set = gauge_set
      @tuning_note = nil
      @tuning_octave = nil
    end

    def tune(note:, octave:)
      @tuning_note = note
      @tuning_octave = octave
    end

    def pluck(fret:, duration: 0.25)
      Note.new(
        root_note: @tuning_note,
        root_octave: @tuning_octave,
        offset: fret,
        duration: duration,
      )
    end

    def heavy?
      gauge_number > standard_gauge_number
    end

    def gauge_number
      @gauge_number ||= StringGauge.new(@gauge_set)[@number]
    end

    private

    def standard_gauge_number
      @standard_gauge_number ||= StringGauge.new(:nine)[@number]
    end
  end
end
