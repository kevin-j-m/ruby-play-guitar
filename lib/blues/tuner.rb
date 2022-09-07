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

      class_name = "#{tuning}_tuning".split("_").map(&:capitalize).join.prepend("Blues::")

      Object.const_get(class_name).pitches.each_with_index do |pitch, index|
        @guitar.strings[index].tune(**pitch)
      end
    end
  end
end
