require 'pry'
require 'colorize'

require_relative 'player'
require_relative 'heads_tails'

class Casino
    attr_accessor :player

    def initialize
        puts "Welcome to the Wise Guys Casino!"
        @player = Player.new
        # need a casino menu
        casino_menu
    end

    def casino_menu
      # casino options
      # game options
      # bankrool - player status
      # quit
      HeadTails.new(player)
    end
end

Casino.new
