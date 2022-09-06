# frozen_string_literal: true

module Blues
  class Guitar
    class String
      attr_reader :tuning_note

      def initialize
        @tuning_note = nil
      end

      def tune(note)
        @tuning_note = note
      end

      def pluck(fret:)
        note_progression
          .cycle
          .find
          .with_index { |_, i| i == fret }
      end

      private

      def note_progression
        start_index = notes.index(@tuning_note)
        notes.rotate(start_index)
      end

      def notes
        [
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
  end
end
