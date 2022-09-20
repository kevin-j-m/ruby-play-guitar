# run with ruby lib/plug_in_pi_shuffle.rb
require_relative "blues"

init = "#{Dir.home}/.sonic-pi/config/init.rb"

def play
  guitar = Blues::Guitar.new
  guitar.restring(gauge_set: :srv)
  guitar.tune(:down_half_step)
  song = Blues::Shuffle.new(guitar)

  amp = Blues::SonicPiAmplifier.new(volume: 10, on: true)
  guitar.plug_in(amplifier: amp)

  song.play { |measure| measure.map { |sound| puts sound } }
  amp
end

play.write_to_file(init, looping: true)
`open "/Applications/Sonic\ Pi.app"`
