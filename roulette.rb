require_relative 'player'

class Roulette
  attr_accessor :player
  def initialize(player)
    @player = player
    @bet_amount = 0
    @all_colors = ["red", "black"]
    @on_color = nil
    @on_number = nil
    roulette_menu
  end

  def place_bet
    @bet_amount = 0
    puts "How much would you like to bet?"
    new_bet = gets.strip.to_i
    @bet_amount = new_bet
  end


  def street
    place_bet
  end

  def straight_up
    place_bet
    puts "What number would you like to place your bet on? (1-36)"
    my_number = gets.strip.to_i
    puts "Spinning!!!!!"
    @on_number = rand(37)
    puts "The ball lands on #{@on_number}!"
    my_number == @on_number ? (puts "Winner!") : (puts "Better luck next spin!")
    my_number == @on_number ? (@player.wallet.amount += @bet_amount * 35) : (@player.wallet.amount -= @bet_amount)

    roulette_menu
  end

  def column
    place_bet
  end

  def even_odd
    place_bet
  end

  def color_bet
    place_bet
    @on_color = nil
    puts "Would you like to bet on red or black?"
    color_choice = gets.strip
    @on_color = @all_colors.sample
    puts "and the ball lands on...#{@on_color}"
    color_choice == @on_color ? (@player.wallet.amount += @bet_amount) : (@player.wallet.amount -= @bet_amount)
    roulette_menu

  end

  def main_menu_choice
    print "> "
    choice = gets.strip.to_i
    case choice
      when 1
        color_bet
      when 2
        even_odd
      when 3
        column
      when 4
        straight_up
      when 5
        street
      when 6
        puts "Thanks for playing!"
      end
  end


  def roulette_menu
    puts "Welcome to Roulette! You have $#{@player.wallet.amount}"
    puts "\nHow would you like to bet?"
    puts "1. Color better (red or black) - pays 1:1"
    puts "2. Even or odd number - pays 1:1"
    puts "3. Column (betting on 12 numbers) - pays 2:1"
    puts "4. Straight up (pick only one number) - pays 35:1"
    puts "5. Street (bet on 3 numbers) - pays 11:1"
    puts "6. Back to main casino"
    main_menu_choice
  end
end
