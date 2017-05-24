require_relative 'player'
require 'pry'
require 'colorize'
class Slots
    attr_accessor :player

    def initialize(player)
        @player = player
        @machine_balance = 0
        @slot_columns = ["cherry", "grape", "lemon", "gold", "apple", "beer", "martini"]
        @slot_spun = []
        @bet = nil
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
        @slot_spun.clear
        pid = fork{ exec 'afplay', "slot_machine.mp3" }
        puts "spinning..."
        sleep(5)
        @slot_spun << @slot_columns.sample
        @slot_spun << @slot_columns.sample
        @slot_spun << @slot_columns.sample
        print @slot_spun
            if @slot_spun[0] == @slot_spun[1] && @slot_spun[1] == @slot_spun[2]
                puts "\sThree in a row!!!! You win!".colorize(:green)
                @machine_balance += @bet * 10
            elsif @slot_spun[0] == @slot_spun[1]
                    @machine_balance += @bet *2
                    puts "\sTwo in a row!! You Win!!".colorize(:green)
            elsif   @slot_spun[1] == @slot_spun[2]
                    @machine_balance += @bet *2
                    puts "\sTwo in a row!! You Win!!".colorize(:green)
            else
                puts "\sNo matches, better luck on your next spin!".colorize(:red)
                    @machine_balance -= @bet
            end
        slot_menu
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
                    @bet = 1
                    slot_result
                when 3
                    @bet = 5
                    slot_result
                when 4
                    @bet = 10
                    slot_result
                when 5
                    cash_out
                else
                    puts "Enter a valid selection"
                    slot_menu
            end
    end
end
