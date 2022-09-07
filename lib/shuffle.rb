# run with ruby lib/shuffle.rb
require_relative "blues"

def format_measure(measure)
  measure.map { |sound| sound.ljust(8, " ") }.join(" ")
end

# amplifier = Blues::TubeAmplifier.new(volume: 10)
amplifier = Blues::SonicPiAmplifier.new(volume: 10)
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
    guitar.pick(string: 5, fret: 7, duration: 1),
  ]
end

# puts format_measure(play_shape_1(guitar))
# sleep(3)
# puts format_measure(play_shape_1(guitar))
# sleep(1)
# 2.times { puts format_measure(play_shape_2(guitar)) }
# sleep(1)
# 2.times { puts format_measure(play_shape_1(guitar)) }
# sleep(1)
# puts format_measure(play_shape_3(guitar))
# sleep(1)
# puts format_measure(play_shape_2(guitar))
# sleep(1)
# puts format_measure(play_shape_1(guitar))
# sleep(1)
# puts format_measure(play_shape_4(guitar))

# amplifier.write_to_file("temp.rb")

def shuffle_one(guitar)
  [
    guitar.pick(string: 5, fret: 0, duration: 0.6666),
    guitar.pick(string: 4, fret: 2, duration: 0.3333),
    guitar.pick(string: 4, fret: 4, duration: 0.6666),
    guitar.pick(string: 4, fret: 2, duration: 0.333),
    guitar.pick(string: 4, fret: 5, duration: 0.6666),
    guitar.pick(string: 4, fret: 2, duration: 0.333),
    guitar.pick(string: 4, fret: 4, duration: 0.666),
    guitar.pick(string: 4, fret: 2, duration: 0.333),
  ]
end

def shuffle_four(guitar)
  [
    guitar.pick(string: 4, fret: 0, duration: 0.6666),
    guitar.pick(string: 3, fret: 2, duration: 0.3333),
    guitar.pick(string: 3, fret: 4, duration: 0.6666),
    guitar.pick(string: 3, fret: 2, duration: 0.333),
    guitar.pick(string: 3, fret: 5, duration: 0.6666),
    guitar.pick(string: 3, fret: 2, duration: 0.333),
    guitar.pick(string: 3, fret: 4, duration: 0.666),
    guitar.pick(string: 3, fret: 2, duration: 0.333),
  ]
end

def shuffle_five(guitar)
  [
    guitar.pick(string: 5, fret: 5, duration: 0.6666),
    guitar.pick(string: 4, fret: 7, duration: 0.3333),
    guitar.pick(string: 3, fret: 4, duration: 0.6666),
    guitar.pick(string: 4, fret: 7, duration: 0.333),
    guitar.pick(string: 3, fret: 5, duration: 0.6666),
    guitar.pick(string: 4, fret: 7, duration: 0.333),
    guitar.pick(string: 3, fret: 4, duration: 0.666),
    guitar.pick(string: 4, fret: 7, duration: 0.333),
  ]
end
pi = Blues::SonicPiAmplifier.new(volume: 3)
pi.turn_on

pi_guitar = Blues::Guitar.new(amplifier: pi)
pi_guitar.tune(:standard)
shuffle_one(pi_guitar)
shuffle_four(pi_guitar)
shuffle_one(pi_guitar)
shuffle_one(pi_guitar)
shuffle_four(pi_guitar)
shuffle_four(pi_guitar)
shuffle_one(pi_guitar)
shuffle_one(pi_guitar)
shuffle_five(pi_guitar)
shuffle_four(pi_guitar)
shuffle_one(pi_guitar)
pi_guitar.pick(string: 6, fret: 5, duration: 0.666)
pi_guitar.pick(string: 6, fret: 5, duration: 0.333)
pi_guitar.pick(string: 5, fret: 5, duration: 0.666)
pi_guitar.pick(string: 5, fret: 7, duration: 1.334)

pi.write_to_file("temp.rb", looping: true)
# pi.write_to_file("#{Dir.home}/.sonic-pi/config/init.rb", looping: true)
# `open "/Applications/Sonic\ Pi.app"`
