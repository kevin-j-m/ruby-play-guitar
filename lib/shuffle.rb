# run with ruby lib/shuffle.rb
require_relative "blues"

def format_measure(measure)
  measure.map { |sound| sound.ljust(8, " ") }.join(" ")
end

amplifier = Blues::TubeAmplifier.new(volume: 10)
amplifier.turn_on

guitar = Blues::Guitar.new(amplifier: amplifier)
guitar.restring(gauge_set: :srv)
guitar.tune(:standard)
# guitar.tune(:down_half_step)

def play_shape_1(guitar)
  [
    guitar.pick(string: 6, fret: 5),
    guitar.pick(string: 6, fret: 5),
    guitar.pick(string: 4, fret: 7),
    guitar.pick(string: 4, fret: 7),
    guitar.pick(string: 4, fret: 5),
    guitar.pick(string: 4, fret: 5),
    guitar.pick(string: 5, fret: 7),
    guitar.pick(string: 5, fret: 7),
  ]
end

def play_shape_2(guitar)
  [
    guitar.pick(string: 5, fret: 5),
    guitar.pick(string: 5, fret: 5),
    guitar.pick(string: 3, fret: 7),
    guitar.pick(string: 3, fret: 7),
    guitar.pick(string: 3, fret: 5),
    guitar.pick(string: 3, fret: 5),
    guitar.pick(string: 4, fret: 7),
    guitar.pick(string: 4, fret: 7),
  ]
end

def play_shape_3(guitar)
  [
    guitar.pick(string: 5, fret: 7),
    guitar.pick(string: 5, fret: 7),
    guitar.pick(string: 3, fret: 9),
    guitar.pick(string: 3, fret: 9),
    guitar.pick(string: 3, fret: 7),
    guitar.pick(string: 3, fret: 7),
    guitar.pick(string: 4, fret: 9),
    guitar.pick(string: 4, fret: 9),
  ]
end

# TODO: chords?
def play_shape_4(guitar)
  [
    guitar.pick(string: 6, fret: 5),
    guitar.pick(string: 5, fret: 5),
    guitar.pick(string: 5, fret: 7),
  ]
end

puts format_measure(play_shape_1(guitar))
sleep(3)
puts format_measure(play_shape_1(guitar))
sleep(1)
2.times { puts format_measure(play_shape_2(guitar)) }
sleep(1)
2.times { puts format_measure(play_shape_1(guitar)) }
sleep(1)
puts format_measure(play_shape_3(guitar))
sleep(1)
puts format_measure(play_shape_2(guitar))
sleep(1)
puts format_measure(play_shape_1(guitar))
sleep(1)
puts format_measure(play_shape_4(guitar))
