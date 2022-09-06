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
      end

      it "plays notes on every string" do
        guitar = Guitar.new
        guitar.tune

        notes = (1..6).map do |string|
          guitar.pick(string: string, fret: 0).note.value
        end

        expect(notes).to eq [:e, :b, :g, :d, :a, :e]
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
  end
end
