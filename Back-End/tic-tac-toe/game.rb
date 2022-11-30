require_relative 'grid.rb' # load GridVariables

# Game mechanics

def play_game(playerOne, playerTwo)
  board = Marshal.load(Marshal.dump(GridVariables::BOARD)) 
  board_indexes = Marshal.load(Marshal.dump(GridVariables::BOARD_ARR)) 
  puts "\n#{board}"

  game_ongoing = true
  player = playerOne # Inital player
  while game_ongoing
    turn(player, board, board_indexes)
  end
end

def turn(player, board, board_indexes)
  print "#{player.name}, choose a spot (1-9) available to occupy with #{player.symbol}: "
  choice = gets.chomp.to_i
  if choice.between?(1,9) && board_indexes[choice - 1]
    board_indexes[choice - 1] = player.symbol
    print "Placement succesfull!"
    print board
  end
end
