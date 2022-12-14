require 'pry-byebug'

class Game 

  attr_accessor :left_guesses, :player_guess
  attr_reader :rand_word

  def initialize()
    @left_guesses = 12
    @rand_word = pick_word()
    @player_guess = ""
    @wrong_letters = Array.new()
    @correct_letters = Array.new()
    for i in 0...@rand_word.length 
      i != @rand_word.length-1 ? @player_guess += "_ " : @player_guess += "_"
    end
  end

  def pick_word()
    words = Array.new(0)
    File.foreach("#{__dir__}/google-10000-english-no-swears.txt") { |line| words.push(line.chomp) if line.chomp.length.between?(5,12) }
    return words[rand(0...words.size)]
  end

  def turn()
    print "\nCurrent status: #{@player_guess}\n"
    print "Wrong guesses: #{@wrong_letters.join("-")}\n" unless @wrong_letters.empty?
    print "Please enter your guess: "
    
    letter = gets.chomp.downcase
    correct_indices = @rand_word.split("").each_index.select { |index| @rand_word[index] == letter } 

    unless correct_indices.empty?
      word_arr = @player_guess.split("")
      word_arr.delete(" ")

      correct_indices.each do |index|
        word_arr[index] = letter
      end
      @player_guess = word_arr.join(" ")
      @correct_letters.push(letter)
      @left_guesses -= 1
    else
      if @wrong_letters.include?(letter) && @correct_letters.include?(letter)
        print"You can't type a previously guessed letter.\n"
      else
        @wrong_letters.push(letter)
        @left_guesses -= 1
      end
    end

    if check_win()
      print "\nCongratulations, you have won!\n\n"
    elsif @left_guesses == 0
      print "\nOops, you have run out of guesses. The word was #{@rand_word}.\n\n"
    else
      turn()
    end

  end

  def check_win()
    @player_guess.split(" ").include?("_") ? false : true
  end

  def play()
    print "\nA random word between the length of 5 and 12 has been selected. Feedback will be provided according to your guesses.\n"
    turn()
  end

end

game = Game.new()
game.play()
