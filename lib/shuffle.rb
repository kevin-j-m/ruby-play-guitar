# run with ruby lib/shuffle.rb
require_relative "blues"

def format_sound(sound)
  sound.ljust(10, ".")
end

def format_measure(measure)
  measure.map { |sound| format_sound(sound) }.join("")
end

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

def shuffle_end(guitar)
  [
    guitar.pick(string: 6, fret: 5, duration: 0.666),
    guitar.pick(string: 6, fret: 5, duration: 0.333),
    guitar.pick(string: 5, fret: 5, duration: 0.666),
    guitar.pick(string: 5, fret: 7, duration: 1.334),
  ]
end

pi = Blues::SonicPiAmplifier.new(volume: 3)
pi.turn_on

tube = Blues::TubeAmplifier.new(volume: 10)
tube.turn_on

tube_amp = false
tube_amp = true

guitar = Blues::Guitar.new(amplifier: pi)
guitar.restring(gauge_set: :srv)
guitar.tune(:down_half_step)

if tube_amp
  guitar = Blues::Guitar.new(amplifier: tube)
  guitar.tune(:standard)
end

results = shuffle_one(guitar)
if tube_amp
  puts format_measure(results)
end
sleep(1)

results = shuffle_four(guitar)
if tube_amp
  puts format_measure(results)
end
sleep(1)

results = shuffle_one(guitar)
if tube_amp
  puts format_measure(results)
end
sleep(1)

results = shuffle_one(guitar)
if tube_amp
  puts format_measure(results)
end
sleep(1)

results = shuffle_four(guitar)
if tube_amp
  puts format_measure(results)
end
sleep(1)

results = shuffle_four(guitar)
if tube_amp
  puts format_measure(results)
end
sleep(1)

results = shuffle_one(guitar)
if tube_amp
  puts format_measure(results)
end
sleep(1)

results = shuffle_one(guitar)
if tube_amp
  puts format_measure(results)
end
sleep(1)

results = shuffle_five(guitar)
if tube_amp
  puts format_measure(results)
end
sleep(1)

results = shuffle_four(guitar)
if tube_amp
  puts format_measure(results)
end
sleep(1)

results = shuffle_one(guitar)
if tube_amp
  puts format_measure(results)
end
sleep(1)

results = shuffle_end(guitar)
if tube_amp
  puts format_measure(results)
end

if !tube_amp
 pi.write_to_file("temp.rb", looping: true)

 # pi.write_to_file("#{Dir.home}/.sonic-pi/config/init.rb", looping: true)
 # `open "/Applications/Sonic\ Pi.app"`
end
