# Game class

class Game
  
  def initialize()
    @colors = ['blue', 'green', 'red', 'yellow', 'orange', 'purple', 'pink']
    @picked_seq = {},
    @current_guesses = {}
    @current_feedback = []
  end

  def play()
    puts "Welcome to the game Mastermind! A random sequence has been picked, you have 8 turns to guess the color. Feedback will be provided accordingly."
    for i in (0..3)
      @picked_seq[i] = @colors[rand(0..@colors.length-1)]
    end
    turn()
  end

  def turn()
    print "Please enter your guess for color: "
    color_guess = gets.chomp.downcase
    print "Please enter your guess for position (Entering a previously guessed position will overwrite previous guess!): "
    pos_guess = gets.chomp.to_i-1
    @current_guesses[pos_guess] = color_guess

    feedback()
  end 

  def feedback()
    @current_guesses.each do |key, value| 
      @current_feedback.push("black") if @picked_seq[key] == value 
    end
  end
end

test = Game.new()
test.play()