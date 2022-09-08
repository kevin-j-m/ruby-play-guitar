# run with ruby lib/base_amp_shuffle.rb
require_relative "blues"

tube = Blues::Amplifier.new(volume: 10)
tube.turn_on

guitar = Blues::Guitar.new(amplifier: tube)
guitar.restring(gauge_set: :srv)
guitar.tune(:standard)

shuffle = Blues::Shuffle.new(guitar)

shuffle.play do |measure|
  puts measure.map { |sound| sound.ljust(10, ".") }.join("")
end
