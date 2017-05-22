require 'pry'
require 'colorize'
require_relative 'player'
require_relative 'heads_tails'
require_relative 'blackjack'
require_relative 'turtle'
require_relative 'slots'
require_relative 'roulette'


class Casino
    attr_accessor :player

    def initialize
        puts "Welcome to the Wise Guys Casino!"
        @player = Player.new
        casino_menu
    end

    def casino_menu
      # casino options
      # game options
      # bankrool - player status
      # quit
      puts "You have $#{@player.wallet.amount} to play with.  Which game would you like to play?\n"
      puts "1. Heads or Tails?"
      puts "2. Blackjack"
      puts "3. Turtle racing"
      puts "4. Slots"
      puts "5. Roulette"
      puts "6. Exit"

      case gets.strip.to_i
        when 1
          HeadTails.new(player)
        when 2
          BlackJack.new(player)
        when 3
          Turtle.new(player)
        when 4
          Slots.new(player)
        when 5
          Roulette.new(player)
        when 6
          exit(0)
      end
    casino_menu
end

Casino.new
