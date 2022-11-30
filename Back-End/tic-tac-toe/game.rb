require_relative 'grid.rb' # load GridVariables

# Game mechanics

def play_game(playerOne, playerTwo)
  grid = Grid.new()
  puts "\n#{grid.board}"

  game_ongoing = true
  player = playerOne # Inital player
  while game_ongoing
    turn(player, grid)
  end
end

def turn(player, grid)
  print "#{player.name}, choose a spot (1-9) available to occupy with #{player.symbol}: "
  choice = gets.chomp.to_i
  if choice.between?(1,9) && (1..9).to_a.include?(grid.indexes[choice - 1])
    grid.updateBoard(choice-1, player.symbol)
    puts "Placement succesfull!"
    puts "\n#{grid.board}"
  end
end
