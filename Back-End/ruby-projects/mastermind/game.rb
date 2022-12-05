# Game class

class Game
  def initialize()
    @colors = ['blue', 'green', 'red', 'yellow', 'orange', 'purple', 'pink']
    @picked_color = ""
    @current_feedback = []
  end

  def play()
    print("Welcome to the game Mastermind! A random color has been picked, you have 8 turns to guess the color. Feedback will be provided accordingly.")
    @picked_color = colors[rand(0..colors.length-1)] # Computer picks random color
  end

  def turn()
    
  end

  def feedback()

  end
end