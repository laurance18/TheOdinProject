require 'pry-byebug'


a =  <<-QUA
       test | test | test
       -----+------+-----
       test | test | test
       -----+------+-----
       test | test | test
    QUA

puts a

def indices(words, searched_word)
    words.each_index.select { |index| words[index] == searched_word }
  end

print indices(["a", "b","a"], "a")