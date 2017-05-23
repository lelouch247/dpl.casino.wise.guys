require_relative 'wallet'

class Player
    attr_accessor :name, :age, :gender, :wallet

    def initialize
    #need to think about how to implement wallet/money
    #this could (should be) a class
    #or just an attribute on the user

    puts "What is your name?".colorize(:yellow)
    @name = gets.strip
    puts 'How much money are you playing with?'.colorize(:yellow)
    @wallet = Wallet.new(gets.to_f)
    puts "what is your gender?".colorize(:yellow)
    @gender = gets.strip
    puts "what is your age?".colorize(:yellow)
    @age = gets.strip.to_i
    end
end
