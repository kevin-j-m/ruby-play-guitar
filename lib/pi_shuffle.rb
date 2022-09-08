# run with ruby lib/pi_shuffle.rb
require_relative "blues"

amp = Blues::SonicPiAmplifier.new(volume: 10)
amp.turn_on

guitar = Blues::Guitar.new(amplifier: amp)
guitar.restring(gauge_set: :srv)
guitar.tune(:down_half_step)

shuffle = Blues::Shuffle.new(guitar)

shuffle.play do |measure|
  measure.map { |sound| puts sound }
end

# amp.write_to_file("temp.rb", looping: true)
amp.write_to_file("#{Dir.home}/.sonic-pi/config/init.rb", looping: true)
`open "/Applications/Sonic\ Pi.app"`
