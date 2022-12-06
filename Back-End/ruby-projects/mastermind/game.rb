# Game class

class Game
  
  @@turn_counter = 0

  def initialize()
    @colors = ['blue', 'green', 'red', 'yellow', 'orange', 'purple', 'pink']
    @picked_seq = Hash.new()
    @current_guesses = Hash.new()
    @current_feedback = Hash.new()
  end

  def play()
    print "Welcome to the game Mastermind! A random sequence has been picked, you have 8 turns to guess the color. Feedback will be provided accordingly.\n\n"
    for i in (0..3)
      @picked_seq[i] = @colors[rand(0..@colors.length-1)]
    end
    puts @picked_seq.values.join(" ")
    turn()
  end

  def turn()
    @@turn_counter += 1
    if @@turn_counter > 8
      puts "Unfortunately, you could not find the sequence in 8 rounds!"
    else
      print "Please enter your guess for color: "
      color_guess = gets.chomp.downcase
      print "Please enter your guess for position (Entering a previously guessed position will overwrite previous guess!): "
      pos_guess = gets.chomp.to_i-1
      @current_guesses[pos_guess] = color_guess
      
      if checkWin()
        puts "Congratulations, you have won!"
      else
        feedback()
      end
    end
  end 

  def feedback()
    @current_guesses.each do |key, value| 
      if @picked_seq[key] == value 
        @current_feedback[value] = "Black" 
      elsif @picked_seq.values.include?(value)
        @current_feedback[value] = "White"
      end 
    end
    print "Current feedback: #{@current_feedback.values.join(" / ")}\n\n"
    turn()
  end

  def checkWin()
    return true if @picked_seq == @current_guesses
    return false
  end

end
