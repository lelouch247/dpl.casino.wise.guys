require "pry"
require_relative 'player'
require_relative 'deck'

class BlackJack
  def initialize(player)
    @dealer_bank = []
    puts "Welcome to black jack!!!!! Where the jack is black and Black Jack Black plays!!!"
    puts "How much do you want to bet?"
    bet = gets.to_f
    player_bet = player.wallet.amount - bet
    @dealer_bank << bet
    @deck = Deck.new
    binding.pry

    player_total = player_first_card + player_second_card
    player_first_card = @deck.cards.sample.rank
    player_second_card = @deck.cards.sample.rank
    dealer_first_card = @deck.cards.sample.rank
    puts "Dealer has #{@deck.cards.sample.suit}"
    puts "You have #{@deck.cards.sample.suit}"
    puts "and #{@deck.cards.sample.suit}."
    puts "Your total is #{@deck.cards.sample.suit}"
    puts "Do you wanna 1) hit or 2) stay?"

    case gets.to_i
    when 1
      players_hit
    when 2
      puts "And dealer has #{@deck.cards.sample.suit}"
    else
      BlackJack.new
    end
  end

  def players_hit
    new_card = @deck.cards.sample.rank
    puts "#{new_card}"
    if new_card <= 21
    end

  end
end
