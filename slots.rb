require_relative 'player'
require 'pry'

class Slots
    attr_accessor :player

    def initialize(player)
        @player = player
        @machine_balance = 0
        @slot_columns = ["cherry", "grape", "lemon", "gold", "apple", "beer", "martini"]
        @slot_spun = []
        puts "----------SLOTS!----------\n"
        #put ascii slot machine here
        puts "\nWelcome #{player.name}"
        slot_menu
    end

    def add_money
        puts "You have $#{@player.wallet.amount} in your wallet, how much would you like to put in the machine?"

        in_machine = gets.to_i
        if in_machine < @player.wallet.amount
            @machine_balance = @machine_balance + in_machine
            @player.wallet.amount = @player.wallet.amount - in_machine
            puts "$#{in_machine} added to the slot machine balance\n"
            slot_menu
        else
            puts "You don't have that much in your wallet try again"
            add_money
        end
    end

    def slot_result
        puts "spinning..."
        @slot_spun << @slot_columns.sample
        @slot_spun << @slot_columns.sample
        @slot_spun << @slot_columns.sample
        puts @slot_spun
    end

    def play_1
        @slot_spun.clear
        puts "Player bets $1"
        slot_result

        case @slot_spun.uniq.length
            when 3
                puts "Better luck next time!"
                 @machine_balance -= 1
                slot_menu
            when 2
                puts "Winner! $3"
                @machine_balance += 3
                slot_menu
            when 1
                puts "Winner, winner, chicken dinner! + 20"
                @machine_balance += 20
                slot_menu
        end
    end

    def play_5
        @slot_spun.clear
        puts "Player bets $5"
        slot_result

        case @slot_spun.uniq.length
            when 3
                puts "Better luck next time!"
                @machine_balance -= 5
                slot_menu
            when 2
                puts "Winner! $15"
                @machine_balance += 15
                slot_menu
            when 1
                puts "Winner, winner, chicken dinner! + 100"
                @machine_balance += 100
                slot_menu
        end
    end

    def play_10
        @slot_spun.clear
        puts "Player bets $10"
        slot_result

        case @slot_spun.uniq.length
            when 3
                puts "Better luck next time!"
                @machine_balance -= 10
                slot_menu
            when 2
                puts "Winner! $30"
                @machine_balance += 30
                slot_menu
            when 1
                puts "Winner, winner, chicken dinner! + 200"
                @machine_balance += 200
                slot_menu
        end
    end

    def cash_out
        @player.wallet.amount += @machine_balance
        @machine_balance = 0
    end

    def slot_menu
        print "\nThe balance in your wallet is\s"
        print "$#{@player.wallet.amount}".colorize(:green)
        print "\n\nThe balance in the slot machine is\s" 
        print "$#{@machine_balance}".colorize(:green)
        puts "\nWhat would you like to do?"
        puts "\n\t1. Add money from your wallet to the machine"
            if @machine_balance > 0        
                puts "\t2. play $1"
                puts "\t3. play $5"
                puts "\t4. play $10"
            else
                puts "\t(You must add money to the machine before proceeding)"
            end
        puts "\t5. cash out and return to the main menu"

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
