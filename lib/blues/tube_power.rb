# frozen_string_literal: true

module Blues
  module TubePower
    def turn_on
      @on = true
      if @warm_up.nil?
        @warm_up = TubeWarmUp.new
      end

      super
    rescue NoMethodError
      nil
    end

    def turn_off
      @on = false
      @warm_up = nil

      super
    rescue NoMethodError
      nil
    end

    def warm_up_complete?
      return false unless @warm_up

      @warm_up.complete?
    end

    def volume
      return @volume if warm_up_complete?
      return 0 unless @warm_up

      (@volume * @warm_up.volume_scale).floor
    end
  end
end
