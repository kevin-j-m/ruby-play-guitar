# frozen_string_literal: true

module Blues
  class Guitar
    attr_reader :strings

    def initialize(tuning: :standard)
      @tuning = tuning
      @strings = [nil, nil, nil, nil, nil, nil]
    end

    def pick(string:, fret:)
      note_progression(@strings[string - 1])
        .cycle
        .find
        .with_index { |_, i| i == fret }
    end

    def tune(tuning = nil)
      if tuning
        @tuning = tuning
      end

      if @tuning == :standard
        standard_tuning
      end

      tuning
    end

    private

    def note_progression(string_tuning)
      start_index = notes.index(string_tuning)
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

    def standard_tuning
      @strings[0] = :e
      @strings[1] = :a
      @strings[2] = :d
      @strings[3] = :g
      @strings[4] = :b
      @strings[5] = :e
    end
  end
end
