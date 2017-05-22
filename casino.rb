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
      puts "Which game would you like to play?"
      case gets.strip.to_i
      when 1
      HeadTails.new(player)
      when 2
        BlackJack.new(player)
      when 3
        Turtle.new(player)
      when 4
        Slot.new(player)
      when 5
        Roulette.new(player)

    end
end

Casino.new
