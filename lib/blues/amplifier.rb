# frozen_string_literal: true

module Blues
  class Amplifier
    MAX_VOLUME = 10.freeze

    attr_reader :volume

    def initialize(volume: 0)
      @on = false
      @volume = volume
    end

    def turn_on
      @on = true
    end

    def turn_off
      @on = false
    end

    def on?
      @on
    end

    def volume=(value)
      @volume = [value, MAX_VOLUME].min
    end

    def amplify(sound)
      modified_sound = pre_amp_stage(sound)
      power_amp_stage(modified_sound)
    end

    def pre_amp_tone
      " "
    end

    def pre_amp_weight
      :average
    end

    def power_amp_weight
      :average
    end

    def weight
      parts = [pre_amp_weight, power_amp_weight].to_set

      if parts.size == 1
        parts.first
      else
        :average
      end
    end

    private

    def pre_amp_stage(sound)
      sound
    end

    def power_amp_stage(sound)
      speaker = "#{speaker_level}[#{volume}]"

      if audible?
        "#{sound.to_s}#{pre_amp_tone}#{speaker}"
      else
        speaker
      end
    end

    def speaker_level
      if !audible?
        "🔇"
      elsif low_volume?
        "🔈"
      elsif mid_volume?
        "🔉"
      elsif high_volume?
        "🔊"
      end
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
