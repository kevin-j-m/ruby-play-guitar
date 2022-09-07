# run with ruby lib/shuffle.rb
require_relative "blues"

def format_measure(measure, amplifier)
  measure.map { |sound| amplifier.amplify(sound.note).ljust(8, " ") }.join(" ")
  # measure.map { |sound| sound.note.to_s.ljust(2, " ") }.join(" ")
end

guitar = Blues::Guitar.new
guitar.restring(gauge_set: :srv)
guitar.tune(:standard)
# guitar.tune(:down_half_step)

shape_1 = [
  guitar.pick(string: 6, fret: 5),
  guitar.pick(string: 6, fret: 5),
  guitar.pick(string: 4, fret: 7),
  guitar.pick(string: 4, fret: 7),
  guitar.pick(string: 4, fret: 5),
  guitar.pick(string: 4, fret: 5),
  guitar.pick(string: 5, fret: 7),
  guitar.pick(string: 5, fret: 7),
]

shape_2 = [
  guitar.pick(string: 5, fret: 5),
  guitar.pick(string: 5, fret: 5),
  guitar.pick(string: 3, fret: 7),
  guitar.pick(string: 3, fret: 7),
  guitar.pick(string: 3, fret: 5),
  guitar.pick(string: 3, fret: 5),
  guitar.pick(string: 4, fret: 7),
  guitar.pick(string: 4, fret: 7),
]

shape_3 = [
  guitar.pick(string: 5, fret: 7),
  guitar.pick(string: 5, fret: 7),
  guitar.pick(string: 3, fret: 9),
  guitar.pick(string: 3, fret: 9),
  guitar.pick(string: 3, fret: 7),
  guitar.pick(string: 3, fret: 7),
  guitar.pick(string: 4, fret: 9),
  guitar.pick(string: 4, fret: 9),
]

# TODO: chords?
shape_4 = [
  guitar.pick(string: 6, fret: 5),
  guitar.pick(string: 5, fret: 5),
  guitar.pick(string: 5, fret: 7),
]

amplifier = Blues::TubeAmplifier.new(volume: 5)
amplifier.turn_on
sleep(5)
2.times { puts format_measure(shape_1, amplifier) }
sleep(1)
2.times { puts format_measure(shape_2, amplifier) }
sleep(1)
2.times { puts format_measure(shape_1, amplifier) }
sleep(1)
puts format_measure(shape_3, amplifier)
sleep(1)
puts format_measure(shape_2, amplifier)
sleep(1)
puts format_measure(shape_1, amplifier)
sleep(1)
puts format_measure(shape_4, amplifier)
