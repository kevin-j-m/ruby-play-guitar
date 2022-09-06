# frozen_string_literal: true

module Blues
  class Note
    def initialize(root:, offset:)
      @note_progression = notes.rotate(notes.index(root)).cycle
      @offset = offset
    end

    def value
      @value ||= @note_progression.take(@offset + 1).last
    end

    def to_s
      "#{value_string[0].upcase}#{'b' if flat?}"
    end

    private

    def flat?
      value_string.end_with?("_flat")
    end

    def value_string
      @value_string ||= value.to_s
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
