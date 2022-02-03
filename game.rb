require './player'
require './question'

class Game
  def initialize
    @players = [
      Player.new('Player 1'),
      Player.new('Player 2')
    ]
    @current_player = 0
  end

  def current_player
    @players[@current_player]
  end

  def start
    puts "Welcome to TwO-O-Player!\n------------------------\n"
    greet_players
    puts "May the best player win!\n---------------------------------\n"
    until game_over? do
      @players.each do |player|
        question = Question.new
        puts "\n#{player.name}: What is #{question.num_1} plus #{question.num_2}?"
        input = gets.chomp.to_i
        if input == question.answer
          puts "------------------------\nYouuuu'rreee great!\n------------------------"
        else
          puts "------------------------\nWomp!\n------------------------"
          current_player.lives = player.subtract_point
          game_over?
        end
        swap_players
        print_scores
      end
    end
    puts "-----------------------------------------"
    @players.any? { |player|
    if(player.lives > 0)
      puts "--------------- GAME-OVER ------------------"
      puts "#{player.name} Wins!!!"
      puts "WINNER -> #{player.name} with #{player.lives}/3 lives"
    end
    }
  end

  # Helper functions
  def game_over?
    @players.any? { |player| player.lives <= 0 }
  end

  def swap_players
    @current_player = (@current_player + 1) % @players.length
  end

  def greet_players
    @players.each do |player|
      puts "Hello #{player.name}"
      puts "Would you like to change your name? (Y/N)"
      if gets.chomp == "Y"
        puts "Enter your new name: "
        player.name = gets.chomp
        puts "Your new name is: #{player.name}"
        puts "---------------------------------"
      end
    end
  end

  def print_scores
    @players.each do |player|
      puts "#{player.name} has #{player.lives} lives"
    end
    puts "\n------------------------------------\n"
  end

end