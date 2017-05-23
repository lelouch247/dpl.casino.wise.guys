require_relative 'player'

class Roulette
  attr_accessor :player
  def initialize(player)
    roulette_menu
  end

  @bet_amount = 0
  @all_numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
                11, 12, 13, 14, 15, 16, 17, 18, 19,
                20, 21, 22, 23, 24, 25, 26, 27, 28,
                29, 30, 31, 32, 33, 34, 35, 36]

  @all_colors = ["red", "green"]


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
  end

  def column
    place_bet
  end

  def even_odd
    place_bet
  end

  def color_bet
    place_bet
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
  end
end
