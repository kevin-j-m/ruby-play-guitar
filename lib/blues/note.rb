# frozen_string_literal: true

module Blues
  class Note
    def initialize(root:, offset:)
      @note_progression = notes.rotate(notes.index(root)).cycle
      @offset = offset
    end

    def value
      @note_progression.take(@offset + 1).last
      # @note_progression.find.with_index { |_, i| i == @offset }
    end

    private

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
