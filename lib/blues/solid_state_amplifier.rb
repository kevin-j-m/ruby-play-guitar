# frozen_string_literal: true

module Blues
  class SolidStateAmplifier < Amplifier
    include SolidStatePreAmp, SolidStatePowerAmp
  end
end
