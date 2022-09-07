# frozen_string_literal: true

module Blues
  module TubePreAmp
    include TubePower

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
  end
end
