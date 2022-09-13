# run with ruby lib/note_amp_shuffle.rb
require_relative "blues"

amp = Blues::NoteAmplifier.new(volume: 10)
amp.turn_on

guitar = Blues::Guitar.new(amplifier: amp)
guitar.restring(gauge_set: :srv)
guitar.tune(:standard)

shuffle = Blues::Shuffle.new(guitar)

shuffle.play do |measure|
  puts measure.map { |sound| sound }.join(" ")
end
