require 'pry-byebug'

def caesar_cipher(string = "", shift = 0)
    #   65..90 A..Z
    #   97..122 a..z
    for k in 0...string.length do 
        char_ord = string[k].ord
        
        ord_list = case char_ord
            when 65..90 then (65..90).to_a
            when 97..122 then (97..122).to_a
            else next
        end
        
        new_char_index = ord_list.find_index(char_ord).to_i
        string[k] = ord_list[new_char_index-shift].chr
    end
    string
end

puts caesar_cipher("Hello World!", 18)