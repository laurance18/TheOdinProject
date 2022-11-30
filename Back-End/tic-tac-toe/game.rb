require_relative 'grid.rb' # load GridVariables

# Game mechanics

def play_game(playerOne, playerTwo)
  grid = Grid.new()
  puts "\n#{grid.board}"

  game_ongoing = true
  count = 0
  while game_ongoing
    turn(playerOne, grid) if count % 2 == 0
    turn(playerTwo, grid) if count % 2 != 0
    count += 1
    game_ongoing = checkWin(grid)
  end
end

def turn(player, grid)
  print "#{player.name}, choose a spot (1-9) available to occupy with #{player.symbol}: "
  choice = gets.chomp.to_i
  if choice.between?(1,9) && (1..9).to_a.include?(grid.indexes[choice - 1])
    grid.updateBoard(choice-1, player.symbol)
    puts "\n#{grid.board}"
  end
end

def checkWin(grid)
  grid.WINNING_COMBOS.each do |combo|
    current = Array.new()
    combo.each do |index|
      current.push(grid.indexes[index])
    end
    return false if current.uniq.size == 1
  end
  return true
end
