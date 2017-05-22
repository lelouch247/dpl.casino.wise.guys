require 'pry'
require 'colorize'

require_relative 'player'

class Casino
    def initialize
        puts "Welcome to the Wise Guys Casino!"
        @player = Player.new
    end
end

Casino.new