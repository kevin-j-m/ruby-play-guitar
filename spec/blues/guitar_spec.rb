# frozen_string_literal: true

module Blues
  RSpec.describe Guitar do
    describe "#tune" do
      it "tunes the strings to the tuning specified when calling the method" do
        guitar = Guitar.new

        expect { guitar.tune(:down_half_step) }
          .to change { guitar.strings.map(&:tuning_note) }
          .from([nil, nil, nil, nil, nil, nil])
          .to([:e_flat, :b_flat, :g_flat, :d_flat, :a_flat, :e_flat])
      end

      it "raises an exception when tuning to an unknown tuning" do
        guitar = Guitar.new

        expect { guitar.tune(:weird_open_tuning) }
          .to raise_error "unknown tuning"
      end
    end

    describe "#pick" do
      it "provides information about what is played" do
        guitar = Guitar.new
        guitar.tune

        expect(guitar.pick(string: 1, fret: 12)).to have_attributes(
          string_number: 1,
          fret_number: 12,
          note: an_object_having_attributes(value: :e),
        )
        # expect(guitar.pick(string: 1, fret: 12)).to eq "E5 🔉[5]"
      end

      it "outputs sound through the provided amplifier" do
        amp = Amplifier.new(volume: 5)
        amp.turn_on

        guitar = Guitar.new(amplifier: amp)
        guitar.tune

        expect(guitar.pick(string: 1, fret: 12)).to eq "E5 🔉[5]"
      end

      it "plays no note and has no sound if the amplifier isn't turned on" do
        amp = Amplifier.new(volume: 5)

        guitar = Guitar.new(amplifier: amp)
        guitar.tune

        expect(guitar.pick(string: 1, fret: 12)).to eq "🔇🔇[5]"
      end

      it "has no output for a practice amp" do
        amp = PracticeAmplifier.new(volume: 5)
        amp.turn_on

        guitar = Guitar.new(amplifier: amp)
        guitar.tune

        expect(guitar.pick(string: 1, fret: 12)).to be_nil
      end

      it "plays notes on every string" do
        guitar = Guitar.new
        guitar.tune

        notes = (1..6).map do |string|
          guitar.pick(string: string, fret: 0).note.value
        end

        expect(notes).to eq [:e, :b, :g, :d, :a, :e]
        # notes = (1..6).map do |string|
        #   guitar.pick(string: string, fret: 0)[0...2]
        # end

        # expect(notes).to eq ["E4", "B3", "G3", "D3", "A2", "E2"]
      end
    end

    describe "#restring" do
      it "changes the strings with the gauge specified" do
        guitar = Guitar.new

        expect { guitar.restring(gauge_set: :srv) }
          .to change { guitar.strings.map(&:gauge_number) }
          .from([9, 11, 16, 24, 32, 42])
          .to([13, 15, 19, 28, 38, 58])
      end
    end

    describe "#plug_in" do
      it "changes the amplifier to what's passed in" do
        tube_amp = TubeAmplifier.new
        guitar = Guitar.new

        expect { guitar.plug_in(amplifier: tube_amp) }
          .to change { guitar.amplifier }
          .from(nil)
          .to(tube_amp)
      end
    end
  end
end
