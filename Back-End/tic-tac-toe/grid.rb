
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
