require_relative 'player'

class Turtle
  attr_accessor :player
  def initialize(player)

    @turtle_name = ["Timmy", "Boris", "Gordy", "Dave", "Sammy"]
    @player = player

    puts "<-----------------Welcome to Turtle Racing!------------------>"
    puts " "
    puts " "
    puts " "
#main_menu
    puts @turtle_name
    turtle_name = gets.strip.to_s
    if @turtle_name.include?(turtle_name)
      bets
    else
      puts "Invalid turtle name!"
      Turtle.new(player)
    end
  end

  def bets
    puts "You have $#{@player.wallet.amount}"

  end
end
