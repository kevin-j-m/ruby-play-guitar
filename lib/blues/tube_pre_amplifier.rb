# frozen_string_literal: true

module Blues
  class TubePreAmplifier
    include TubePower

    def initialize(volume: 0)
      @volume = volume
      @on = false
    end

    def pre_amp_tone
      if low_volume? || mid_volume?
        "💡"
      elsif high_volume?
        "🔥"
      else
        " "
      end
    end

    def pre_amp_weight
      :heavy
    end

    def volume=(vol)
      @volume = vol
    end

    private

    def on?
      @on
    end

    def low_volume?
      audible? && volume < 4
    end

    def mid_volume?
      volume >= 4 && volume < 8
    end

    def high_volume?
      volume >= 8
    end

    def audible?
      on? && volume > 0
    end
  end
end
