require 'pry-byebug'
require_relative 'player.rb'
require_relative 'game.rb'

# Board setup

board_array = (1..9).to_a
board =  <<-HEREDOC
    #{board_array[0]} | #{board_array[1]} | #{board_array[2]}
  ----+---+----
    #{board_array[3]} | #{board_array[4]} | #{board_array[5]}
  ----+---+----
    #{board_array[6]} | #{board_array[7]} | #{board_array[8]}
HEREDOC

WINNING_COMBOS = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
  [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
].freeze # Winning combinations


print "Name of the player #1: "
curr_name = gets.chomp
print "Symbol for the player #1: "
curr_symbol = gets.chomp

playerOne = Player.new(curr_name, curr_symbol)

print "\nName of the player #2: "
curr_name = gets.chomp
print "Symbol for the player #2: "
curr_symbol = gets.chomp

playerTwo = Player.new(curr_name, curr_symbol)

game(playerOne, playerTwo, board)
