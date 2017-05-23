require_relative "player"

class HeadsTails


  def initialize(player)
    @player = player
    @bet = 0
    @heads_tails = ["heads", "tails"]
    puts "Welcome to Heads Tails"
    puts "#{player.name} you have a balance of: #{player.wallet.amount}"

    heads_tails_menu
  end

  def heads_tails_menu
    puts "1) Place your bet\n2) quit"
    case gets.to_i
    when 1
      betting
    when 2
      puts "Thanks for playing! Don't worry the game was rigged anyways."
    else
      puts "Please enter 1 or 2"
      heads_tails_menu

    end

  end

  def betting
    puts "How much would you like to bet?"
    @bet = gets.to_f
    rigging
  end

  def rigging
    puts "Do you want heads or tails?"
    @user_choice = gets.strip.downcase
    if @user_choice == "heads"
      @heads_tails << "tails"
      game
    elsif @user_choice == "tails"
      @heads_tails << "heads"
      game
    end
  end


def game
  if @heads_tails.sample == @user_choice
    win_game
  else
    lose_game
  end
end

  def win_game
    puts "YOU WIN!!!!"
    @player.wallet.amount += (@bet * 2)
    puts @player.wallet.amount
    heads_tails_menu
  end

  def lose_game
    puts "YOU LOSE SUCKA!!!!"
    @player.wallet.amount -= @bet
    puts @player.wallet.amount
    heads_tails_menu
  end
end
