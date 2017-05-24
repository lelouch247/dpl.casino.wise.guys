require_relative 'player'
require 'pry'



class Turtle
  attr_accessor :player

  def initialize(player)
    @turtle_name = ["Timmy", "Boris", "Gordy", "Dave", "Sammy"]
    @player = player
    turtle_menu
  end

  def turtle_menu
    `say -v "Ava" "Welcome To Turtle Racing. Where Losers Like You Have The Chance To Be Winners"`
    puts "                            ||WELCOME TO TURTLE RACING||\n".colorize(:green)
    `say -v "Ava" "Okay #{player.name} are you ready to give this a go?"`
    puts "\nGet ready to play #{player.name.colorize(:green)}!".colorize(:red)
    puts " "
    puts " "
    puts " "
    puts " "
    puts "                               █▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█".colorize(:green)
    puts "                               █░░╦─╦╔╗╦─╔╗╔╗╔╦╗╔╗░░█".colorize(:green)
    puts "                               █░░║║║╠─║─║─║║║║║╠─░░█".colorize(:green)
    puts "                               █░░╚╩╝╚╝╚╝╚╝╚╝╩─╩╚╝░░█".colorize(:green)
    puts "                               █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█".colorize(:green)
    puts " "
    puts " "
    puts " "
    puts " "
    puts " "
    puts " "
    puts " "
    puts @turtle_name
    print "\n|------> "
    `say -v "daniel" "Alright Alright yuh wench!! Quiet Down. Now #{player.name} pick your turtle. Theres Timid Timmy, Boris the Brave, Gordy the Great, Dave The Drunk, Sammy the Shivery Sack"`
    `say -v "Ava" "I beg your pardon? This is my race! Why dont you check yourself into a school for old english farts.... Now #{player.name} please continue."`
    @my_turtle = gets.strip.to_s.capitalize
    `say -v "daniel" "Ohhh pipe down ya broken hag! Dis is my thing a ma jigger i'm hosting. #{player.name} please dont listen to that stale old wench. Place your bet"`
    if @turtle_name.include?(@my_turtle)
      bets
    else
      puts "Invalid turtle name!"
      Turtle.new(player)
    end
  end

  def play_again
    puts "Play again? Y/N?"
    again = gets.strip

    if again == "Y"
      Turtle.new(player)
    elsif again == "N"
      puts "Thanks for playing"
    else
      "please enter a valid selection"
      play_again
    end
  end

  def bets
    @mainbet = 0

    puts "You have $#{@player.wallet.amount}. How much would you like to bet?"
    print "> "
    @mainbet = gets.to_i
    puts "Your bet is #{@mainbet}"
    puts "\n\n\n "
    `say -v "Ava" "Fuhhhhhhhhhhhhhhhhhhh the race has begun! I'm so mad at that fool, lets talk after the race."`
    pid = fork{ exec 'afplay', "gun_shot.mp3" }
    sleep(3)
    puts "Turtles Are Racing..."
    puts " "
    puts " "
    puts " "
    sleep(1)


    puts "                                                                      | ™".colorize(:blue)
    puts "                                                                      |  "
    puts "    –––––––––>                                                        | F".colorize(:red)
    sleep(1)
    puts "                ––––––––––>                                           | I".colorize(:red)
    sleep(1)
    puts "                              ––––––––––>                             | N".colorize(:red)
    sleep(1)
    puts "                                            ––––––––––>               | S".colorize(:red)
    sleep(1)
    puts "                                                          ––––––––––> | H".colorize(:red)
    sleep(1)
    puts "                                                                      |  "
    puts "                                                                      | ™".colorize(:blue)
    puts " "
    sleep(1)
    puts "THE RESULTS ARE IN...\n\n\n"
    `say -v "daniel" "talk after the race... wow that dirty deed of a damsel should not talk after the race but walk off the nearest cliff and call it good riddance too her!"`
    sleep(2)
    if @turtle_name.sample == @my_turtle

    `say -v "ava" "daniel you insignificant slimy sack of a man... how dare you treat me with such shivelry ardent demise you great big gardantuas grip of a broken boy"`
      puts "||#{@my_turtle}|| the turtle is..."
      puts " "
      puts " "
      sleep(2)
      puts "The..."
      puts " "
      sleep(2)
      puts " "
      puts "******** W I N N E R ********"
      `say -v "daniel" "Holy flaming foot AVA shut your pie hole we Have a Winner"`
      sleep(3)
      puts "\n\n\n "
      @player.wallet.amount += @mainbet
    else
      puts "#{@my_turtle} the turtle is..."
      puts " "
      puts " "
      sleep(2)
      puts "The..."
      puts " "
      sleep(2)
      puts " "
      puts "******** L O S E R ********"
      `say -v "daniel" "Holy crap of a stallion Ava, shut that stink of a mouth of yours we've got a big freaking LOSer. HA ha ha ha ha ha ha ha ha ha"`
      sleep(3)
      puts "\n\n\n"
      @player.wallet.amount -= @mainbet
      puts "\n\n\n"
    end
  end
end
