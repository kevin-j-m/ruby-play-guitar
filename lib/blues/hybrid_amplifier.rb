# frozen_string_literal: true

module Blues
  class HybridAmplifier < Amplifier
    include TubePreAmp, SolidStatePowerAmp
  end
end
