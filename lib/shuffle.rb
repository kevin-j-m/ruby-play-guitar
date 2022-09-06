# run with ruby lib/shuffle.rb
require_relative "blues"

guitar = Blues::Guitar.new
guitar.tune

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

2.times { puts shape_1.map(&:note).join(" ") }
2.times { puts shape_2.map(&:note).join(" ") }
2.times { puts shape_1.map(&:note).join(" ") }
puts shape_3.map(&:note).join(" ")
puts shape_2.map(&:note).join(" ")
puts shape_1.map(&:note).join(" ")
puts shape_4.map(&:note).join(" ")
