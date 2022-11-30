require_relative 'grid.rb' # load GridVariables

# Game mechanics

def play_game(playerOne, playerTwo)
  curr_board = Marshal.load(Marshal.dump(GridVariables::BOARD)) # Copy const into mutable var
end

