# frozen_string_literal: true

module Blues
  class NoteAmplifier < Amplifier
    def amplify(sound)
      "#{sound.first}#{sound.last}"
    end
  end
end
