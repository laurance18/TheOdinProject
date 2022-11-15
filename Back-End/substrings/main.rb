require 'pry-byebug'

def substrings(text = "", dict = [])
    
    # Default dict
    dict = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"] if dict.size == 0
    results = Hash.new(0)

    text.split(" ").each do |word|
        dict.each do |substr|
            if word.downcase.include?(substr.downcase)
                results[substr] += 1
            end
        end
    end
    results
end

puts substrings('Howdy below!')