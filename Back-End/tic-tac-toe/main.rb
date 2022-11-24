require 'pry-byebug'
require_relative 'grid.rb'
require_relative 'player.rb'

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

print playerTwo.name
