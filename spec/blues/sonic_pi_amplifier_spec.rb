# frozen_string_literal: true

module Blues
  RSpec.describe SonicPiAmplifier do
    describe "#amplify" do
      it "formats the output for a sonic pi" do
        amp = SonicPiAmplifier.new(volume: 3)
        amp.turn_on

        note = Note.new(root_note: :c, root_octave: 1, offset: 0)

        expect(amp.amplify(note)).to eq "with_synth :pluck do\n  play(:C1, release: 0.25)\nend\nsleep(0.25)\n"
      end

      it "has no output when the amp isn't turned on" do
        amp = SonicPiAmplifier.new(volume: 3)

        note = Note.new(root_note: :c, root_octave: 1, offset: 0)

        expect(amp.amplify(note)).to eq ""
      end
    end
  end
end
