
# Grid Class

class Grid
  attr_accessor :indexes
  attr_accessor :board
  attr_reader :COMBOS

  def initialize()
    @indexes = (1..9).to_a
    @board = <<-HEREDOC
      1 | 2 | 3
    ----+---+----
      4 | 5 | 6
    ----+---+----
      7 | 8 | 9
    HEREDOC
    @COMBOS = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
        [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
      ].freeze # Winning combinations
  end

  def updateBoard(index, symbol)
    @indexes[index] = symbol
    @board = <<-HEREDOC
      #{@indexes[0]} | #{@indexes[1]} | #{@indexes[2]}
    ----+---+----
      #{@indexes[3]} | #{@indexes[4]} | #{@indexes[5]}
    ----+---+----
      #{@indexes[6]} | #{@indexes[7]} | #{@indexes[8]}
    HEREDOC
  end
end
