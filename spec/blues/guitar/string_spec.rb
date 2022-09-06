# frozen_string_literal: true

module Blues
  class Guitar
    RSpec.describe String do
      describe "#tune" do
        it "tunes the string to the tuning specified" do
          string = String.new(number: 2)

          expect { string.tune(:a) }
            .to change { string.tuning_note }
            .from(nil)
            .to(:a)
        end
      end

      describe "#pluck" do
        it "plays the string note if no fret is depressed" do
          string = String.new(number: 1)
          string.tune(:e)

          expect(string.pluck(fret: 0)).to eq :e
        end

        it "plays the string note on the 12th fret" do
          string = String.new(number: 1)
          string.tune(:e)

          expect(string.pluck(fret: 12)).to eq :e
        end

        it "progresses to each note as you walk up the frets" do
          string = String.new(number: 1)
          string.tune(:e)

          notes = (0..11).map do |fret|
            string.pluck(fret: fret)
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
end
