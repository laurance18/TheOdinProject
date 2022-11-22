
# Player class for the two players

class Player
  attr_reader :name
  attr_reader :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end