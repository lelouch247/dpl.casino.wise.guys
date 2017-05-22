require_relative 'player'

class Turtle
  attr_accessor :player
  def initialize(player)

    @turtle_name = ["Timmy", "Boris", "Gordy", "Dave", "Sammy"]
    @player = player

    puts "                   ||WELCOME TO TURTLE RACING||                   "
    puts "[Pick Your Turtle]"
    puts @turtle_name
    @my_turtle = gets.strip.to_s.capitalize
    if @turtle_name.include?(@my_turtle)
      bets
    else
      puts "Invalid turtle name!"
      Turtle.new(player)
    end
  end

  def bets

    @mainbet = 0

    puts "You have $#{@player.wallet.amount}. How much would you like to bet?"
    print "> "
    @mainbet = gets.to_i
    puts "Your bet is #{@mainbet}"
    if @turtle_name.sample == @my_turtle
      puts "Your Turtle Wins"
    else
      puts "You Lose"
    end
  end
end
