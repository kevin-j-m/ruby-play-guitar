# frozen_string_literal: true

module Blues
  class SonicPiAmplifier < Amplifier
    def initialize(volume: 0)
      @on = false
      @volume = volume
      @sounds = []
    end

    def write_to_file(location)
      File.open(location, "w") do |file|
        @sounds.each do |sound|
          file.write sound
        end
      end
    end

    private

    def power_amp_stage(sound)
      return "" unless audible?

      play_operation = "play(:#{sound.to_s}"
      output = sound_output(play_operation, duration: sound.duration)
      @sounds << output

      output
    end

    def sound_output(play_operation, duration: 0.25)
      [
        "with_synth :pluck do",
        "  #{play_operation}, release: #{duration})",
        "end",
        "sleep(#{duration})\n",
      ].join("\n")
    end
  end
end
