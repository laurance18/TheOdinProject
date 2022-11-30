
# Grid Variables
module GridVariables
  # Board setup

  BOARD_ARR = (1..9).to_a
  BOARD =  <<-HEREDOC
      #{BOARD_ARR[0]} | #{BOARD_ARR[1]} | #{BOARD_ARR[2]}
    ----+---+----
      #{BOARD_ARR[3]} | #{BOARD_ARR[4]} | #{BOARD_ARR[5]}
    ----+---+----
      #{BOARD_ARR[6]} | #{BOARD_ARR[7]} | #{BOARD_ARR[8]}
  HEREDOC

  WINNING_COMBOS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
    [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
  ].freeze # Winning combinations
end