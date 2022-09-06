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

    private

    def pre_amp_stage(sound)
      sound
    end

    def power_amp_stage(sound)
      return unless audible?

      "#{sound.to_s}🔈[#{volume}]"
    end

    def audible?
      on? && volume > 0
    end
  end
end
