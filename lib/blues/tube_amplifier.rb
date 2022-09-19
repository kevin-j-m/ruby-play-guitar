# frozen_string_literal: true

module Blues
  class TubeAmplifier < Amplifier
    include TubePower

    def pre_amp_tone
      pre_amp.pre_amp_tone
    end

    def pre_amp_weight
      pre_amp.pre_amp_weight
    end

    def turn_on
      pre_amp.turn_on

      super
    end

    def power_amp_weight
      power_amp.power_amp_weight
    end

    private

    def pre_amp
      @pre_amp ||= TubePreAmplifier.new(volume: @volume)
    end

    def power_amp
      @power_amp ||= TubePowerAmplifier.new
    end
  end
end
