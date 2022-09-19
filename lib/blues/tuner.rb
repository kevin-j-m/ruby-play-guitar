# frozen_string_literal: true

module Blues
  module Tuner
    VALID_TUNINGS = [
      :all_fifths,
      :all_fourths,
      :down_half_step,
      :drop_d,
      :modal_c,
      :open_a,
      :standard,
    ].freeze

    def tune(tuning = :standard)
      raise "unknown tuning" unless VALID_TUNINGS.include?(tuning)

      class_name = "#{tuning}_tuning".split("_").map(&:capitalize).join.prepend("Blues::")

      Object.const_get(class_name).pitches.each_with_index do |pitch, index|
        strings[index].tune(**pitch)
      end
    end
  end
end
