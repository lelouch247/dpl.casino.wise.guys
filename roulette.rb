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
      if new_bet <= @player.wallet.amount
        @bet_amount = new_bet
      else
        puts "You don't have enough cash to bet that much."
        place_bet
      end
  end


  def straight_up
    place_bet
    puts "What number would you like to place your bet on? (1-36)"
    my_number = gets.strip.to_i
    pid = fork{ exec 'afplay', "roulette.mp3" }
    puts "Spinning!!!!!"
    sleep(10)
    @on_number = rand(37)
    puts "The ball lands on #{@on_number}!"
    my_number == @on_number ? (puts "Winner!") : (puts "Better luck next spin!")
    my_number == @on_number ? (@player.wallet.amount += @bet_amount * 35) : (@player.wallet.amount -= @bet_amount)

    roulette_menu
  end

  def column
    place_bet
    puts "Which column of numbers would you like to bet one?"
    puts "1. Numbers 1-12"
    puts "2. Numbers 13-24"
    puts "3. Numbers 25-36"

    my_column = gets.strip.to_i
    pid = fork{ exec 'afplay', "roulette.mp3" }
    puts "Spinning!!!!"
    sleep(10)

    @on_number = rand(37)

    puts "The ball lands on #{@on_number}!"
    case my_column
      when 1
        @on_number.between?(1,12) ? (puts "Winner!") : (puts "Better luck next spin!")
        @on_number.between?(1,12) ? (@player.wallet.amount += @bet_amount * 2) : (@player.wallet.amount -= @bet_amount)
        roulette_menu
      when 2
        @on_number.between?(13,24) ? (puts "Winner!") : (puts "Better luck next spin!")
        @on_number.between?(13,24) ? (@player.wallet.amount += @bet_amount * 2) : (@player.wallet.amount -= @bet_amount)
        roulette_menu
      when 3
        @on_number.between?(24,36) ? (puts "Winner!") : (puts "Better luck next spin!")
        @on_number.between?(25,36) ? (@player.wallet.amount += @bet_amount * 2) : (@player.wallet.amount -= @bet_amount)
        roulette_menu
    end
  end

  def even_odd
    place_bet
    puts "Would you like to be on an even or an odd number"
    even_or_odd = gets.strip
    puts "Spinning!!!!"
    pid = fork{ exec 'afplay', "roulette.mp3" }
    sleep(10)
    @on_number = rand(37)
    puts "The ball lands on #{@on_number}"

    case even_or_odd
      when "even"
        @on_number%2 == 0 ? (puts "Winner!") : (puts "Better luck next spin!")
        @on_number%2 == 0 ? (@player.wallet.amount += @bet_amount) : (@player.wallet.amount -= @bet_amount)
        roulette_menu
      when "odd"
        @on_number%2 != 0 ? (puts "Winner!") : (puts "Better luck next spin!")
        @on_number%2 != 0 ? (@player.wallet.amount += @bet_amount) : (@player.wallet.amount -= @bet_amount)
        roulette_menu
      end
  end

  def color_bet
    place_bet
    @on_color = nil
    puts "Would you like to bet on red or black?"
    color_choice = gets.strip
    pid = fork{ exec 'afplay', "roulette.mp3" }
    puts "Spinning...."
    sleep(10)
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
            puts "Thanks for playing!"
        end
  end


  def roulette_menu
    if @player.wallet.amount < 1
      puts "\n\nYou ran out of money. Goodbye"
      puts "\n\n"
      exit(0)
    else
      print "\n\nWelcome to Roulette! You have\s"
      print "$#{@player.wallet.amount}\n".colorize(:green)
      puts "\nHow would you like to bet?"
      puts "\n\t1. Bet on a color (red or black) - pays 1:1"
      puts "\t2. Even or odd number - pays 1:1"
      puts "\t3. Column (betting on 12 numbers) - pays 2:1"
      puts "\t4. Straight up (pick only one number) - pays 35:1"
      puts "\t5. Back to main casino"
      main_menu_choice
    end
  end
end
