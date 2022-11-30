
# Grid Variables
module GridVariables
  # Board setup

  board_indexes = (1..9).to_a
  BOARD =  <<-HEREDOC
      #{board_indexes[0]} | #{board_indexes[1]} | #{board_indexes[2]}
    ----+---+----
      #{board_indexes[3]} | #{board_indexes[4]} | #{board_indexes[5]}
    ----+---+----
      #{board_indexes[6]} | #{board_indexes[7]} | #{board_indexes[8]}
  HEREDOC

  WINNING_COMBOS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
    [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
  ].freeze # Winning combinations
end