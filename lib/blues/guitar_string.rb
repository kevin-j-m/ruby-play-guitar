# frozen_string_literal: true

module Blues
  class GuitarString
    attr_reader :number,
      :tuning_note

    def initialize(number:, gauge_set: :nine)
      @number = number
      @gauge_set = gauge_set
      @tuning_note = nil
    end

    def tune(note)
      @tuning_note = note
    end

    def pluck(fret:)
      Note.new(root: @tuning_note, offset: fret)
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
