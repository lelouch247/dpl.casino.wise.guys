require_relative 'wallet'

class Player
    attr_accessor :name, :age, :gender, :wallet

    def initialize
    #need to think about how to implement wallet/money
    #this could (should be) a class
    #or just an attribute on the user
    puts "What is your name?"
    @name = gets.strip
    puts "what is your age?"
    @age = gets.strip.to_i
    puts "what is your gender?"
    @gender = gets.strip
    puts 'How much money are you playing with?'
    @wallet = Wallet.new(gets.to_f)
    end
end
