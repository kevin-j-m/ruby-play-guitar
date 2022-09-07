# frozen_string_literal: true

module Blues
  RSpec.describe Amplifier do
    describe "#turn_on" do
      it "sets the amplifier on when it is off" do
        amp = Amplifier.new

        expect { amp.turn_on }
          .to change { amp.on? }
          .from(false)
          .to(true)
      end

      it "does nothing when the amplifier is already on" do
        amp = Amplifier.new
        amp.turn_on

        expect { amp.turn_on }
          .not_to change { amp.on? }
          .from(true)
      end
    end

    describe "#turn_off" do
      it "sets the amplifier off when it is on" do
        amp = Amplifier.new
        amp.turn_on

        expect { amp.turn_off }
          .to change { amp.on? }
          .from(true)
          .to(false)
      end

      it "does nothing when the amplifier is already off" do
        amp = Amplifier.new

        expect { amp.turn_off }
          .not_to change { amp.on? }
          .from(false)
      end
    end

    describe "#on?" do
      it "is not on at the start" do
        amp = Amplifier.new

        expect(amp.on?).to eq false
      end

      it "is on after the amp has been turned on" do
        amp = Amplifier.new
        amp.turn_on

        expect(amp.on?).to eq true
      end
    end

    describe "#volume=" do
      it "sets the volume to the level provided" do
        amp = Amplifier.new

        expect { amp.volume = 7 }
          .to change { amp.volume }
          .from(0)
          .to(7)
      end

      it "does not exceed the maximum volume" do
        amp = Amplifier.new

        expect { amp.volume = 11 }
          .to change { amp.volume }
          .from(0)
          .to(10)
      end
    end

    describe "#amplify" do
      it "provides the sound value at the volume specified" do
        amp = Amplifier.new(volume: 3)
        amp.turn_on

        note = Note.new(root_note: :c, root_octave: 1, offset: 0)

        expect(amp.amplify(note)).to eq "C1 🔈[3]"
      end

      it "produces no sound when the amplifier isn't turned on" do
        amp = Amplifier.new(volume: 3)
        note = Note.new(root_note: :c, root_octave: 1, offset: 0)

        expect(amp.amplify(note)).to eq "🔇[3]"
      end

      it "does nothing when the amplifier is on but with no volume" do
        amp = Amplifier.new(volume: 0)
        amp.turn_on

        note = Note.new(root_note: :c, root_octave: 1, offset: 0)

        expect(amp.amplify(note)).to eq "🔇[0]"
      end
    end
  end
end
