# frozen_string_literal: true

module Blues
  RSpec.describe Note do
    describe "#value" do
      it "is the root note with no offset" do
        note = Note.new(root: :c, offset: 0)

        expect(note.value).to eq :c
      end

      it "is the root note again when going up 12 notes" do
        note = Note.new(root: :c, offset: 12)

        expect(note.value).to eq :c
      end

      it "progresses to each note" do
        note_values = (0..11).map do |offset|
          Note.new(root: :c, offset: offset).value
        end

        expect(note_values).to eq [
          :c,
          :d_flat,
          :d,
          :e_flat,
          :e,
          :f,
          :g_flat,
          :g,
          :a_flat,
          :a,
          :b_flat,
          :b,
        ]
      end
    end

    describe "#to_s" do
      it "capitalizes the note" do
        note = Note.new(root: :c, offset: 0)

        expect(note.to_s).to eq "C"
      end

      it "uses a 'b' to denote a flat" do
        note = Note.new(root: :c, offset: 1)

        expect(note.to_s).to eq "Db"
      end
    end
  end
end
