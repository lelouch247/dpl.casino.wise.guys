require 'pry'
require 'colorize'

require_relative 'player'

class Casino
    attr_accessor :player

    def initialize
        puts "Welcome to the Wise Guys Casino!"
        @player = Player.new
        binding.pry 
    end
end

Casino.new
