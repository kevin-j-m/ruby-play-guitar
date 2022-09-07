# frozen_string_literal: true

module Blues
  class TubeAmplifier < Amplifier
    include TubePreAmp, TubePowerAmp
  end
end
