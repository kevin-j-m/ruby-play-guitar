# frozen_string_literal: true

module Blues
  class TubeWarmUp < Amplifier
    SECONDS_TO_WARM_UP = 10.freeze

    def initialize
      @time_turned_on = Time.now
    end

    def complete?
      seconds_warmed_up >= SECONDS_TO_WARM_UP
    end

    def volume_scale
      return 1 if complete?

      (seconds_warmed_up / SECONDS_TO_WARM_UP).floor(1)
    end

    private

    def seconds_warmed_up
      Time.now - @time_turned_on
    end
  end
end
