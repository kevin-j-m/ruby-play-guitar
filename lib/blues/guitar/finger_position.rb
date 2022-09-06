# frozen_string_literal: true

module Blues
  class Guitar
    class FingerPosition
      def initialize(string:, fret:)
        @string = string
        @fret = fret
      end

      def note
        @string.pluck(fret: @fret)
      end

      def string_number
        @string.number
      end

      def fret_number
        @fret
      end
    end
  end
end
