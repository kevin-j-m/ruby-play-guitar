# frozen_string_literal: true

module Blues
  RSpec.describe GuitarString do
    describe "#tune" do
      it "tunes the string to the tuning specified" do
        string = GuitarString.new(number: 2)

        expect { string.tune(:a) }
          .to change { string.tuning_note }
          .from(nil)
          .to(:a)
      end
    end

    describe "#pluck" do
      it "plays the string note if no fret is depressed" do
        string = GuitarString.new(number: 1)
        string.tune(:e)

        expect(string.pluck(fret: 0).value).to eq :e
      end

      it "plays the string note on the 12th fret" do
        string = GuitarString.new(number: 1)
        string.tune(:e)

        expect(string.pluck(fret: 12).value).to eq :e
      end

      it "progresses to each note as you walk up the frets" do
        string = GuitarString.new(number: 1)
        string.tune(:e)

        notes = (0..11).map do |fret|
          string.pluck(fret: fret).value
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

    describe "#heavy?" do
      it "is heavy when the string gauge exceeds the number fo a set of nines" do
        string = GuitarString.new(number: 1, gauge_set: :eleven)

        expect(string.heavy?).to eq true
      end

      it "is not heavy when the string gauge is the same or less than the number for a set of nines" do
        string = GuitarString.new(number: 1, gauge_set: :nine)

        expect(string.heavy?).to eq false
      end
    end

    describe "#gauge_number" do
      it "provides the gauge size of the string" do
        string = GuitarString.new(number: 1, gauge_set: :eleven)

        expect(string.gauge_number).to eq 11
      end
    end
  end
end
