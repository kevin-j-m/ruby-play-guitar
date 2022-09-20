# frozen_string_literal: true

module Blues
  class SonicPiAmplifier < Amplifier
    def initialize(volume: 0, on: false)
      @on = on
      @volume = volume
      @sounds = []
    end

    def write_to_file(location, looping: false)
      File.open(location, "w") do |file|
        file.write "loop do\n" if looping
        @sounds.each do |sound|
          file.write sound
        end
        file.write "end\n" if looping
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
