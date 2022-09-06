# frozen_string_literal: true

module Blues
  RSpec.describe Guitar do
    describe "#tune" do
      it "tunes the strings to the tuning specified at instantiation" do
        guitar = Guitar.new(tuning: :standard)

        expect { guitar.tune }
          .to change { guitar.strings.map(&:tuning_note) }
          .from([nil, nil, nil, nil, nil, nil])
          .to([:e, :a, :d, :g, :b, :e])
      end

      it "tunes the strings to the tuning specified when calling the method" do
        guitar = Guitar.new(tuning: nil)

        expect { guitar.tune(:standard) }
          .to change { guitar.strings.map(&:tuning_note) }
          .from([nil, nil, nil, nil, nil, nil])
          .to([:e, :a, :d, :g, :b, :e])
      end
    end

    describe "#pick" do
      it "" do
        guitar = Guitar.new(tuning: :standard)
        guitar.tune

        expect(guitar.pick(string: 1, fret: 12)).to eq(
          {
            string: 1,
            fret: 12,
            note: :e,
          }
        )
      end

      it "plays notes on every string" do
        guitar = Guitar.new(tuning: :standard)
        guitar.tune

        notes = (1..6).map do |string|
          guitar.pick(string: string, fret: 0)[:note]
        end

        expect(notes).to eq [
          :e,
          :a,
          :d,
          :g,
          :b,
          :e,
        ]
      end
    end
  end
end