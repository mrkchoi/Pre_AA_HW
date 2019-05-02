

# def bubble_sort(arr)
#   sorted = false

#   until sorted
#     sorted = true

#     i = 0
#     while i < arr.length - 1
#       if arr[i] > arr[i + 1]  
#         sorted = false
#         arr[i], arr[i + 1] = arr[i + 1], arr[i]
#       end
#       i += 1
#     end
#   end
  
#   arr
# end


# arr = [5,4,3,2,1]
# p bubble_sort(arr) # => [1,2,3,4,5]






# LC 231: Power of Two

# def is_power_of_two(n)
#   return true if n == 1

#   until n <= 1
#     return false if n % 2 != 0
#     n = n / 2
#   end
#   n == 1
# end

# def is_power_of_two(n)
#   return false if n == 0
#   return true if n == 1
#   (n & (n-1)).to_s(2) == '0'
# end

# p is_power_of_two(2)
# p is_power_of_two(5)
# p is_power_of_two(16)
# p is_power_of_two(256)
# p is_power_of_two(257)

require 'byebug'

def get_sum(a, b)
  b == 0 ? a : get_sum((a^b), (a&b)<<1)
end

# p get_sum(2,3)




def count_ones(n)
  count = 0

  while n != 0
    n = (n & (n-1))
    count += 1
  end

  count
end

# p count_ones(3)
# p count_ones(5)
# p count_ones(7)
# p count_ones(31)



def power_of_two(n)
  return false if n == 0
  return true if n == 1

  (n&(n-1)) == 0
end

# p power_of_two(2)
# p power_of_two(4)
# p power_of_two(5)


def add_two(a, b)
  until b == 0
    carry = (a&b)
    a = (a^b)
    b = carry << 1
  end
  a
end

# p add_two(2,3)
# p add_two(-1,1)

def power_of_four(n)
  n > 0 && (n&(n-1)) == 0 && (n&0x5555555555) == n
end

# p power_of_four(16)
# p power_of_four(15)



def single_number(arr)
  result = 0
  i = 0
  while i < arr.length
    result = result^arr[i]
    i += 1
  end
  result
end

p single_number([1,1,2,2,3,3,4,4,5,5,6,7,7,8,8,9,9])