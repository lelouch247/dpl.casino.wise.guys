require_relative 'player'
require 'pry'

class Slots
    attr_accessor :machine_balance, :player

    def initialize(player)
        @player = player
        @machine_balance = 0
        puts "----------SLOTS!----------\n"
        #put ascii slot machine here
        puts "\nWelcome #{player.name}"
        slot_menu
    end

    def add_money
        puts "You have $#{@player.wallet.amount} in your wallet, how much would you like to put in the machine?"

        in_machine = gets.to_i

        @machine_balance = @machine_balance + in_machine
        @player.wallet.amount = @player.wallet.amount - in_machine
        puts "$#{in_machine} added to the slot machine balance\n"
        slot_menu
    end

    def play_1
    end

    def play_5
    end

    def play_10
    end

    def cash_out
        @player.wallet.amount += @machine_balance   
        @machine_balance = 0
    end

    def slot_menu
        puts "\nThe balance in your wallet is $#{@player.wallet.amount}"
        puts "\nThe balance in the slot machine is $#{@machine_balance}"
        puts "\nWhat would you like to do?"
        puts "1. Add money from your wallet to the machine"
        puts "2. play $1"
        puts "3. play $5"
        puts "4. play $10"
        puts "5. cash out and return to the main menu"

        slot_menu_choice = gets.to_i

        case slot_menu_choice
            when 1
                add_money
            when 2
                play_1
            when 3
                play_5
            when 4
                play_10
            when 5
                cash_out
        end
    end
end