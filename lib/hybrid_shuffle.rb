# run with ruby lib/hybrid_shuffle.rb
require_relative "blues"

tube = Blues::HybridAmplifier.new(volume: 10)
tube.turn_on

guitar = Blues::Guitar.new(amplifier: tube)
guitar.restring(gauge_set: :srv)
guitar.tune(:down_half_step)

shuffle = Blues::Shuffle.new(guitar)

shuffle.play do |measure|
  puts measure.map { |sound| sound.ljust(10, ".") }.join("")
  sleep(1)
end
