require_relative 'player'
require 'pry'

class Turtle
  attr_accessor :player

  def initialize(player)
    @turtle_name = ["Timmy", "Boris", "Gordy", "Dave", "Sammy"]
    @player = player
    turtle_menu
  end

  def turtle_menu
    puts "                       ||WELCOME TO TURTLE RACING||\n"
    puts "\nGet ready to play #{player.name}!"
    puts "\n                           [Pick Your Turtle]"
    puts @turtle_name
    print "\n|------> "
    @my_turtle = gets.strip.to_s.capitalize

    if @turtle_name.include?(@my_turtle)
      bets
    else
      puts "Invalid turtle name!"
      Turtle.new(player)
    end
  end

  def play_again
    puts "Play again? Y/N?"
    again = gets.strip

    if again == "Y"
      Turtle.new(player)
    elsif again == "N"
      puts "Thanks for playing"
    else
      "please enter a valid selection"
      play_again
    end
  end

  def bets
    @mainbet = 0

    puts "You have $#{@player.wallet.amount}. How much would you like to bet?"
    print "> "
    @mainbet = gets.to_i
    puts "Your bet is #{@mainbet}"
    puts "\n\n\n "
    puts "Turtles Are Racing..."
    puts " "
    puts " "
    puts " "
    sleep(1)
    puts "                                                                      | ™"
    puts "                                                                      |   "
    puts "  ––––––––––>                                                         | F"
    sleep(1)
    puts "                ––––––––––>                                           | I"
    sleep(1)
    puts "                              ––––––––––>                             | N"
    sleep(1)
    puts "                                            ––––––––––>               | S"
    sleep(1)
    puts "                                                          ––––––––––> | H"
    sleep(1)
    puts "                                                                      |  "
    puts "                                                                      | ™"
    puts " "
    sleep(1)
    puts "THE RESULTS ARE IN...\n\n\n"
    sleep(2)
    if @turtle_name.sample == @my_turtle
      puts "||#{@my_turtle}|| the turtle is..."
      puts " "
      puts " "
      sleep(2)
      puts "The..."
      puts " "
      sleep(2)
      puts " "
      puts "******** W I N N E R ********"
      sleep(3)
      puts "\n\n\n "
      @player.wallet.amount += @mainbet
    else
      puts "#{@my_turtle} the turtle is..."
      puts " "
      puts " "
      sleep(2)
      puts "The..."
      puts " "
      sleep(2)
      puts " "
      puts "******** L O S E R ********"
      sleep(3)
      puts "\n\n\n"
      @player.wallet.amount -= @mainbet
      puts "\n\n\n"
    end
  end
end
