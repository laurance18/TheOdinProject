require 'pry-byebug'

def bubble_sort(array = [])
    return array if array.empty?
    
    unsorted = true

    # Implement recursion

    for i in 0..(array.length-2) do
        if array[i] > array[i+1]
            array[i], array[i+1] = array[i+1], array[i]
        end
    end
    array
end

print bubble_sort([4,3,78,2,0,2])