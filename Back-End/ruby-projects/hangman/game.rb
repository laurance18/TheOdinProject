
# Game class

class Game 

  attr_accessor :left_guesses 
  attr_reader :rand_word

  def initialize()
    @left_guesses = 7
    @rand_word = pick_word()
  end

  def pick_word()
    words = Array.new(0)
    
    File.foreach("#{__dir__}/google-10000-english-no-swears.txt") { |line| words.push(line.chomp) if line.chomp.length.between?(5,12) }
    return words[rand(0...words.size)]
  end

end

testing = Game.new()
print testing.left_guesses