# frozen_string_literal: true

module Blues
  class Note
    attr_reader :duration

    def initialize(starting_note:, starting_octave:, offset:, duration: 0.25)
      @note_cycle = notes.rotate(notes.index(starting_note)).cycle
      @starting_octave = starting_octave
      @offset = offset
      @duration = duration
    end

    def value
      @value ||= note_progression.last
    end

    def octave
      @starting_octave + octaves_progressed
    end

    def to_s
      "#{value_string[0].upcase}#{'b' if flat?}#{octave}"
    end

    private

    def flat?
      value_string.end_with?("_flat")
    end

    def value_string
      @value_string ||= value.to_s
    end

    def octaves_progressed
      cs_passed = note_progression.count(:c)

      if c_start?
        cs_passed -= 1
      end

      cs_passed
    end

    def c_start?
      @note_cycle.first == :c
    end

    def note_progression
      @note_cycle.take(@offset + 1)
    end

    def notes
      [
        :a_flat,
        :a,
        :b_flat,
        :b,
        :c,
        :d_flat,
        :d,
        :e_flat,
        :e,
        :f,
        :g_flat,
        :g,
      ]
    end
  end
end
