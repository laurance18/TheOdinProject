require 'pry-byebug'

def pick_word()
  words = Array.new(0)
  
  File.foreach("#{__dir__}/google-10000-english-no-swears.txt") { |line| words.push(line.chomp) if line.chomp.length.between?(5,12) }
  return words[rand(0...words.size)]
end

rand_word = pick_word()
