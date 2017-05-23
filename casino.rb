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
        @player.age >= 21 ? casino_menu : bouncer
    end

    def bribe
      print "> "
      bribe = gets.strip
        if bribe == "bribe"
          puts "Oh yeah? How much you going to slip me?"
          print "> "
          bribe_amount = gets.strip.to_i

            if bribe_amount >= 100
              puts "Alright, but don't let anyone know it was me that let you in"
              @player.wallet.amount -= bribe_amount
              casino_menu
            else
              puts "As 'Tony' is beating your ass and throwing you to the curb, you realize what a dumb idea that was"
              exit
            end

          elsif bribe == "flash"
            if @player.gender == "f"
              if @player.age >=18
                puts "NICE! Don't let anyone know it was me that let you in"
                casino_menu
              else
                puts "You trying to get me arrested!?!! GET OUTTA HERE!"
                exit(0)
              end
            else
              puts "I seen bigger dicks on a 2 yr old.  Get outta here!"
              exit
            end


          else
          puts "As 'Tony' is beating your ass and throwing you to the curb, you realize what a dumb idea that was"
          exit
        end
    end

    def bouncer
      bouncer = rand(1..4)
      if bouncer == 1
        puts "The bouncer has not so kindly let you know that your too young to play here"
        puts "You bounce out before he 'beats your ass'"
        exit
      else
        puts "You are too young to play here, but the Tony the bouncer could look away under the right circumstances"
        puts "What would you like to do?"
        bribe
      end
    end

    def casino_menu
      puts "You have $#{@player.wallet.amount} to play with.  Which game would you like to play?\n"
      puts "1. Heads or Tails?"
      puts "2. Blackjack"
      puts "3. Turtle racing"
      puts "4. Slots"
      puts "5. Roulette"
      puts "6. Exit"

      case gets.strip.to_i
        when 1
          HeadsTails.new(player)
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
end

Casino.new
