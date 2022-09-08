# frozen_string_literal: true

require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.ignore("#{__dir__}/base_amp_shuffle.rb")
loader.ignore("#{__dir__}/hybrid_shuffle.rb")
loader.ignore("#{__dir__}/pi_shuffle.rb")
loader.ignore("#{__dir__}/solid_state_shuffle.rb")
loader.ignore("#{__dir__}/tube_shuffle.rb")
loader.setup

module Blues
  class Error < StandardError; end
  # Your code goes here...
end
