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
        Note.new(root: @tuning_note, offset: fret)
          .value
      end
    end
  end
end
