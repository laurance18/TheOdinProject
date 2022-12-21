def merge_sort(array)
  return array if array.size <= 1

  mid = array.size / 2
  left = array[0, mid]
  right = array[mid, array.size]

  left = merge_sort(left)
  right = merge_sort(right)

  merge(left, right)
end

def merge(left, right)
  sorted = []

  until left.empty? || right.empty?
    if left.first <= right.first
      sorted << left.shift
    else
      sorted << right.shift
    end
  end

  sorted.concat(left).concat(right)
end

# Example usage
array = [5, 3, 4, 1, 2]
sorted_array = merge_sort(array)
puts sorted_array 