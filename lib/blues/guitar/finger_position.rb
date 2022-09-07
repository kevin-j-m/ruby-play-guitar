# frozen_string_literal: true

module Blues
  class Guitar
    class FingerPosition
      def initialize(string:, fret:, duration: 0.25)
        @string = string
        @fret = fret
        @duration = duration
      end

      def note
        @string.pluck(fret: @fret, duration: @duration)
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
