require 'pry-byebug'

def stock_picker(array = [])
    return nil if array.empty?
    possible_profits = Hash.new(0)

    array.each_with_index do |num1, ind1|
        array.each_with_index do |num2, ind2|
            if ind1 < ind2 && num1 < num2
                possible_profits[[ind1, ind2]] = (num2-num1).to_i
            end
        end
    end
    return possible_profits.max_by{|key, value| value}[0]
end

print stock_picker([17,3,6,9,15,8,6,1,10])
