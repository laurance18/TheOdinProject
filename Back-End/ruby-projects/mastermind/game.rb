# Game class

class Game
  
  def initialize()
    @colors = ['blue', 'green', 'red', 'yellow', 'orange', 'purple', 'pink']
    @picked_seq = Hash.new()
    @current_guesses = Hash.new()
    @current_feedback = Hash.new()
  end

  def play()
    puts "Welcome to the game Mastermind! A random sequence has been picked, you have 8 turns to guess the color. Feedback will be provided accordingly."
    for i in (0..3)
      @picked_seq[i] = @colors[rand(0..@colors.length-1)]
    end
    puts @picked_seq.values.join(" ")
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
      if @picked_seq[key] == value 
        @current_feedback[value] = "Black" 
      elsif @picked_seq.values.include?(value)
        @current_feedback[value] = "White"
      end 
    end
    print "Current feedback: #{@current_feedback.values.join(" / ")}"
  end

  def checkWin()
    for k in (0..3)
      
    end
  end
  
end

test = Game.new()
test.play()