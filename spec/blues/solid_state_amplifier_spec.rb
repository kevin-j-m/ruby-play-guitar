# frozen_string_literal: true

module Blues
  RSpec.describe TubeAmplifier do
    describe "#amplify" do
      it "provides the sound value at the volume specified" do
        amp = SolidStateAmplifier.new(volume: 3)
        amp.turn_on

        note = Note.new(root_note: :c, root_octave: 1, offset: 0)

        expect(amp.amplify(note)).to eq "C1🫙🔈[3]"
      end

      it "produces no sound when the amplifier isn't turned on" do
        amp = SolidStateAmplifier.new(volume: 3)
        note = Note.new(root_note: :c, root_octave: 1, offset: 0)

        expect(amp.amplify(note)).to eq "🔇[3]"
      end

      it "does nothing when the amplifier is on but with no volume" do
        amp = SolidStateAmplifier.new(volume: 0)
        amp.turn_on

        note = Note.new(root_note: :c, root_octave: 1, offset: 0)

        expect(amp.amplify(note)).to eq "🔇[0]"
      end
    end

    describe "#pre_amp_tone" do
      it "has a clean tone" do
        amp = SolidStateAmplifier.new

        expect(amp.pre_amp_tone).to eq "🫙"
      end
    end
  end
end
