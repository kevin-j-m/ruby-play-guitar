# frozen_string_literal: true

module Blues
  class TubeAmplifier < Amplifier
    SECONDS_TO_WARM_UP = 10.freeze

    def turn_on
      if @time_turned_on.nil?
        @time_turned_on = Time.now
      end

      super
    end

    def turn_off
      @time_turned_on = nil

      super
    end

    def warm_up_complete?
      seconds_warmed_up >= SECONDS_TO_WARM_UP
    end

    # TODO: should this instead happen in the pre_amp_stage?
    def volume
      return @volume if warm_up_complete?

      (@volume * warmed_volume_scale).floor
    end

    private

    def warmed_volume_scale
      return 1 if warm_up_complete?

      seconds_warmed_up / SECONDS_TO_WARM_UP
    end

    def seconds_warmed_up
      return 0 unless @time_turned_on

      Time.now - @time_turned_on
    end
  end
end