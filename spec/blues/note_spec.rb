# frozen_string_literal: true

module Blues
  RSpec.describe Note do
    describe "#value" do
      it "is the root note with no offset" do
        note = Note.new(root_note: :c, root_octave: 1, offset: 0)

        expect(note.value).to eq :c
      end

      it "is the root note again when going up 12 notes" do
        note = Note.new(root_note: :c, root_octave: 1, offset: 12)

        expect(note.value).to eq :c
      end

      it "progresses to each note" do
        note_values = (0..11).map do |offset|
          Note.new(root_note: :c, root_octave: 1, offset: offset).value
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

    describe "#octave" do
      it "retains the same octave with no offset" do
        note = Note.new(root_note: :c, root_octave: 1, offset: 0)

        expect(note.octave).to eq 1
      end

      it "retains the same octave when the offset does not pass the b note" do
        note = Note.new(root_note: :c, root_octave: 1, offset: 11)

        expect(note.octave).to eq 1
      end

      it "moves up an octave when the offset passes a b note" do
        note = Note.new(root_note: :c, root_octave: 1, offset: 12)

        expect(note.octave).to eq 2
      end

      it "moves up two octaves when the offset passes two b notes" do
        note = Note.new(root_note: :c, root_octave: 1, offset: 24)

        expect(note.octave).to eq 3
      end

      it "stays at the same octave when starting at a c" do
        note = Note.new(root_note: :c, root_octave: 1, offset: 0)

        expect(note.octave).to eq 1
      end
    end

    describe "#to_s" do
      it "capitalizes the note and includes the octave" do
        note = Note.new(root_note: :c, root_octave: 1, offset: 0)

        expect(note.to_s).to eq "C1"
      end

      it "uses a 'b' to denote a flat" do
        note = Note.new(root_note: :c, root_octave: 1, offset: 1)

        expect(note.to_s).to eq "Db1"
      end
    end
  end
end
