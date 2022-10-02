# frozen_string_literal: true

module Blues
  RSpec.describe PracticeAmplifier do
    describe "#amplify" do
      it "provides no output" do
        amp = PracticeAmplifier.new
        amp.turn_on

        note = Note.new(starting_note: :c, starting_octave: 1, offset: 0)

        expect(amp.amplify(note)).to be_nil
      end
    end
  end
end
