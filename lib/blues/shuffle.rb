# frozen_string_literal: true

module Blues
  class Shuffle
    attr_reader :guitar

    def initialize(guitar)
      @guitar = guitar
    end

    def play(&block)
      progression.each do |measure|
        block.call(send(measure))
      end
    end

    private

    def progression
      [
        :one,
        :four,
        :one,
        :one,
        :four,
        :four,
        :one,
        :one,
        :five,
        :four,
        :one,
        :last,
      ]
    end

    def one
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

    def four
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

    def five
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

    def last
      [
        guitar.pick(string: 6, fret: 5, duration: 0.666),
        guitar.pick(string: 6, fret: 5, duration: 0.333),
        guitar.pick(string: 5, fret: 5, duration: 0.666),
        guitar.pick(string: 5, fret: 7, duration: 1.334),
      ]
    end
  end
end
