require 'pry-byebug'
require 'Benchmark'

def bubble_sort(array = [])
    return nil if array.empty?
    unsorted = true

    # Implement recursion

    while unsorted do
        current = array.map(&:clone)
        for i in 0..(array.length-2) do
            array[i], array[i+1] = array[i+1], array[i] if array[i] > array[i+1] 
        end
        unsorted = false if current == array
    end
    array
end

print bubble_sort([1,56,76,45,31,3,0])

