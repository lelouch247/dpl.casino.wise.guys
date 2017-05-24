require 'pry'
require 'colorize'
require_relative 'player'
require_relative 'heads_tails'
require_relative 'blackjack'
require_relative 'turtle'
require_relative 'slots'
require_relative 'roulette'
require 'tty-prompt'


class Casino
    attr_accessor :player

    def initialize
      pid = fork{ exec 'afplay', "welcome_to_costco.mp3" }
        puts "\n\n\t\t\t\tWelcome to the Wise Guys Casino!\n\n".colorize(:red)
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
                `say -v Fred "You trying to get me arrested!?!! GET OUTTA HERE!"`
                exit(0)
              end
            else
              `say "I seen bigger dicks on a 2 yr old.  Get outta here!"`
              exit
            end


          else
            `say -v Fred "As 'Tony' is beating your ass, and throwing you to the curb, you realize what a dumb idea that was"`
          exit
        end
    end

    def bouncer
      bouncer = rand(1..4)
      if bouncer == 1
        `say -v Fred "The bouncer has not so kindly let you know that you're too young to play here"`
        `say -v Fred "You bounce out before he 'beats yo ass'"`
        exit
      else
        `say -v Fred "You are too young to play here, but Tony the bouncer could look away under the right circumstances"`
        puts "What would you like to do?".colorize(:green)
        bribe
      end
    end

    def casino_menu

      prompt = TTY::Prompt.new
      game_option = prompt.select("Choose a game", ["Heads or Tails", "Blackjack", "Turtle", "Slots", "Roulette", "Exit"])
      case game_option
      when "Heads or Tails"
          HeadsTails.new(player)
        when "Blackjack"
          BlackJack.new(player)
        when "Turtle"
          Turtle.new(player)
        when "Slots"
          Slots.new(player)
        when "Roulette"
          Roulette.new(player)
        when "Exit"
          puts "Good bye"
          exit(0)


      end
    casino_menu
    end
end

Casino.new
