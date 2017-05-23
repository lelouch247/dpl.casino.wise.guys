require "pry"
require_relative 'player'
require_relative 'deck'

class BlackJack
  def initialize(player)
    @player = player
    @dealer_bank = 0
    @deck = Deck.new
    welcome_blackjack
  end


  def welcome_blackjack
    puts "\nWhere the jack is black, and the Black Jack Black plays!!!\n"
    puts "How much do you want to bet?".colorize(:green)
    @dealer_bank = gets.to_f
      if @dealer_bank >= 1
        blackjack_dealt_cards
      else
        puts "You need to bet more than that bud\n\n"
      end
  end

  def blackjack_dealt_cards
    face_values = { 'Ace' => 11, 'King' => 10, 'Jack' => 10, 'Queen' => 10 }

    @player_total = 0
    @dealer_total = 0

    player_first_card = @deck.cards.sample.rank
    player_second_card = @deck.cards.sample.rank

    puts "You have #{player_first_card} #{@deck.cards.sample.suit}"
      if face_values.has_key? player_first_card
        player_first_card = face_values[player_first_card]
      end

    puts "and #{player_second_card} #{@deck.cards.sample.suit}."
      if face_values.has_key? player_second_card
        player_second_card = face_values[player_second_card]
      end

    dealer_first_card = @deck.cards.sample.rank

    puts "Dealer has #{dealer_first_card} #{@deck.cards.sample.suit}"
      if face_values.has_key? dealer_first_card
        dealer_first_card = face_values[dealer_first_card]
      end

    @dealer_total = dealer_first_card.to_i
    @player_total = player_first_card.to_i + player_second_card.to_i

    puts "Your total is #{@player_total}\nThe dealers total is #{@dealer_total}"
    player_hit_stay

  end

  def player_hit_stay
    puts "Do you wanna 1) hit 2) stay"
    case gets.to_i
    when 1
      players_hit
    when 2
      dealer_hit
    else
      BlackJack.new
    end
  end

  def players_hit
    face_values = { 'Ace' => 11, 'King' => 10, 'Jack' => 10, 'Queen' => 10 }
    new_card = @deck.cards.sample.rank
    puts "#{new_card} #{@deck.cards.sample.suit}"
    if face_values.has_key? new_card
      new_card = face_values[new_card]
    end
    @player_total = @player_total + new_card.to_i

    puts "Your total is #{@player_total}"

    if @player_total <= 21
      player_hit_stay
    elsif @player_total == 21
    else
      player_lose
    end
  end


  def dealer_hit
    face_values = { 'Ace' => 11, 'King' => 10, 'Jack' => 10, 'Queen' => 10 }

    dealer_second_card = @deck.cards.sample.rank
    puts "And dealer has #{dealer_second_card} #{@deck.cards.sample.suit}"
      if face_values.has_key? dealer_second_card
        dealer_second_card = face_values[dealer_second_card]
      end

    @dealer_total = @dealer_total + dealer_second_card.to_i
    puts "Dealer has #{@dealer_total}"


    if @dealer_total > 21
      player_win
    elsif @dealer_total < 21
      dealer_hit
    elsif @player_total == 21 && @dealer_total == 21
      player_dealer_tie
    end
  end

  def player_dealer_tie
    puts "You both got 21. Pot has been returned"
    print "Your total now is\s"
    print "$#{@player.wallet.amount}".colorize(:green)
    play_again
  end

  def player_lose
    puts "YOU LOSE JOHNNY TIGHT LIPS!"
    @player.wallet.amount -= @dealer_bank.to_f
    print "Your total now is\s"
    print "$#{@player.wallet.amount}".colorize(:green)
    play_again
  end

  def player_win
    puts "YOU WIN BOSS"
    @player.wallet.amount += (@dealer_bank.to_f * 1.5)
    print "Your total now is\s"
    print "$#{@player.wallet.amount}".colorize(:green)
    play_again
  end

  def play_again
    puts "Play again? (Y/N)"
    yes_no = gets.split.downcase
      if yes_no == y
        welcome_blackjack
      else
        puts "Please enter Y or N"
        play_again
      end
      if yes_no == n
        puts "Good-bye"
      else
        puts "Please enter Y or N"
        play_again
      end

  end
end
