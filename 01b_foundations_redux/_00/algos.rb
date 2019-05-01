

def bubble_sort(arr)
  sorted = false

  until sorted
    sorted = true

    i = 0
    while i < arr.length - 1
      if arr[i] > arr[i + 1]  
        sorted = false
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
      end
      i += 1
    end
  end
  
  arr
end


arr = [5,4,3,2,1]
p bubble_sort(arr) # => [1,2,3,4,5]
