# frozen_string_literal: true

module Blues
  RSpec.describe Guitar do
    describe "#tune" do
      it "tunes the strings to the tuning specified at instantiation" do
        guitar = Guitar.new(tuning: :standard)

        expect { guitar.tune }
          .to change { guitar.strings }
          .from([nil, nil, nil, nil, nil, nil])
          .to([:e, :a, :d, :g, :b, :e])
      end

      it "tunes the strings to the tuning specified when calling the method" do
        guitar = Guitar.new(tuning: nil)

        expect { guitar.tune(:standard) }
          .to change { guitar.strings }
          .from([nil, nil, nil, nil, nil, nil])
          .to([:e, :a, :d, :g, :b, :e])
      end
    end

    describe "#pick" do
      it "plays the string note if no fret is depressed" do
        guitar = Guitar.new(tuning: :standard)
        guitar.tune

        expect(guitar.pick(string: 1, fret: 0)).to eq :e
      end

      it "plays the string note on the 12th fret" do
        guitar = Guitar.new(tuning: :standard)
        guitar.tune

        expect(guitar.pick(string: 1, fret: 12)).to eq :e
      end

      it "progresses to each note as you walk up the frets" do
        guitar = Guitar.new(tuning: :standard)
        guitar.tune

        notes = (0..11).map do |fret|
          guitar.pick(string: 1, fret: fret)
        end

        expect(notes).to eq [
          :e,
          :f,
          :g_flat,
          :g,
          :a_flat,
          :a,
          :b_flat,
          :b,
          :c,
          :d_flat,
          :d,
          :e_flat,
        ]
      end
    end
  end
end
