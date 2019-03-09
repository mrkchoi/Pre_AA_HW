
require 'byebug'

# # def fact(num)
# #   return 1 if num == 1

# #   num * fact(num - 1)
# # end

# # fact(3)

# # 3 * fact(2) # => 2 * 1



# # def upcase(str)
# #   return str.upcase if str.length <= 1
# #   p str
# #   p str[0].upcase + upcase(str[1..-1])
# # end

# # def iterative_upcase(str)
# #   str.chars.inject('') {|upcased_str, char| upcased_str << char.upcase}
# # end

# # def reverse(str)
# #   return str if str.length <= 1
# #   p str
# #   p str[-1] + reverse(str[0..-2])
# # end

# # => 'HELLO' => 'OLLEH'

# # O + HELL
# # O + L + HEL
# # O + L + L + HE
# # O + L + L + E + H


# # => [5,4,3,6,7,8,3,9,1]

# # def qs(arr)
# #   return arr if arr.length <= 1
# #   pivot = [arr.first]
# #   # => [[5,4,3,3,6,1],[8,9]]
# #   left = arr[1..-1].select {|el| el < arr.first}
# #   right = arr[1..-1].select {|el| el >= arr.first}
# #   # p "------------------------"
# #   # p arr
# #   # p pivot
# #   # p "#{qs(less)} + #{[pivot]} + #{qs(greater)}"
# #   qs(left) + pivot + qs(right)
# # end

# # p qs([5,4,3,6,7,8,3,9,1])




















# # def qs(arr)
# #   return arr if arr.length <= 0

# #   pivot = arr[0]
# #   left = arr[1..-1].select {|el| el > pivot}
# #   right = arr[1..-1].select {|el| el <= pivot}

# #   qs(left) + [pivot] + qs(right)
# # end

# # [9,8,7,7,6,8,5,4,6,6,6,3,4,5,3,2,1,2,4,5,67,8,90,0,0,1]





# # def factorial(n)

# # end





# # ##############################
# # # Recursive exercises
# # ##############################


# # # Write a function sum_to(n) that uses recursion to calculate the sum from 1 to n (inclusive of n).
# # #   # Test Cases
# # #  p sum_to(5)  # => returns 15
# # #  p sum_to(1)  # => returns 1
# # #  p sum_to(9)  # => returns 45
# # #  p sum_to(-8)  # => returns nil
# # #  p sum_to(0)  # => returns nil


# # def sum_to(n)
# #   if n < 0
# #     return nil
# #   elsif n < 1
# #     return 0
# #   elsif n < 2
# #     return 1
# #   end
# #   n + sum_to(n - 1)
# # end




# # # Write a function add_numbers(nums_array) that takes in an array of Integers and returns the sum of those numbers. Write this method recursively.

# # #   # Test Cases
# # # p  add_numbers([1,2,3,4]) # => returns 10
# # # p  add_numbers([3]) # => returns 3
# # # p  add_numbers([-80,34,7]) # => returns -39
# # # p  add_numbers([]) # => returns nil

# # def add_numbers(nums_array)
# #   if nums_array.empty?
# #     return nil
# #   elsif nums_array.length == 1
# #     return nums_array[0]
# #   end

# #   nums_array[0] + add_numbers(nums_array[1..-1])
# # end




# # # Let's write a method that will solve Gamma Function recursively. The Gamma Function is defined Γ(n) = (n-1)!.

# # #   # Test Cases
# # # p gamma_fnc(0)  # => returns nil
# # # p gamma_fnc(1)  # => returns 1
# # # p gamma_fnc(4)  # => returns 6
# # # p gamma_fnc(8)  # => returns 5040

# # def gamma_fnc(n)
# #   if n < 1
# #     return nil
# #   elsif n <= 1
# #     return 1 
# #   end
# #   (n - 1) * gamma_fnc(n - 1)
# # end

# # # # if n = 4
# # # 3 * gamme(3)
# # # 3 * 2 * gamma(2)
# # # 3 * 2 * 1 * 1



# # # Write a function ice_cream_shop(flavors, favorite) that takes in an array of ice cream flavors available at the ice cream shop, as well as the user's favorite ice cream flavor. Recursively find out whether or not the shop offers their favorite flavor.

# # #   # Test Cases
# # # p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
# # # p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
# # # p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
# # # p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
# # # p ice_cream_shop([], 'honey lavender')  # => returns false


# # def ice_cream_shop(flavors, favorite)
# #   return false if flavors.empty?
# #   return true if flavors[0] == favorite
# #   return false if flavors.length == 1
# #   ice_cream_shop(flavors[1..-1], favorite)
# # end






# # # Write a function reverse(string) that takes in a string and returns it reversed.

# # #   # Test Cases
# # #   reverse("house") # => "esuoh"
# # #   reverse("dog") # => "god"
# # #   reverse("atom") # => "mota"
# # #   reverse("q") # => "q"
# # #   reverse("id") # => "di"
# # #   reverse("") # => ""


# # def reverse(string)
# #   return string if string.length <= 1
# #   reverse(string[1..-1]) + string[0]
# # end

# # #  => "Hello"
# # #  => "olle" + "H"






























# # ##############################
# # # Recursion exercises
# # ##############################

# # # Write a recursive method, range, that takes a start and an end and returns an array of all numbers in that range, exclusive. For example, range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return an empty array.

# # # => (1,5) => [1, 2, 3, 4]

# # def range(first, last) 
# #   return [] if last < first
# #   return [first] if (last - first) == 1
# #   [first] + range(first + 1, last)
# # end

# # # [1] + range(2, 5)
# # # [1] + [2] + range(3,5)
# # # [1] + [2] + [3] + range(4,5)
# # # [1] + [2] + [3] + [4]


# # # Write both a recursive and iterative version of sum of an array.

# # # recursive
# # def sum_arr_recursive(arr) # => [1,2,3,4,5]
# #   return arr[0] if arr.length <= 1
# #   arr[0] + sum_arr_recursive(arr[1..-1])
# # end

# # # 1 + sar([2,3,4,5])
# # # 1 + 2 + sar([3,4,5])
# # # 1 + 2 + 3 + sar([4,5])
# # # 1 + 2 + 3 + 4 + sar([5])
# # # 1 + 2 + 3 + 4 + 5





# # # iterative
# # def sum_arr_iterative(arr)
# #   sum = 0
# #   arr.each {|el| sum += el}
# #   sum
# # end





# # Exponentiation
# # Write two versions of exponent that use two different recursions:

# # # this is math, not Ruby methods.

# # # recursion 1
# # exp(b, 0) = 1
# # exp(b, n) = b * exp(b, n - 1)

# # # recursion 2
# # exp(b, 0) = 1
# # exp(b, 1) = b
# # exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# # exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]


# # Note that for recursion 2, you will need to square the results of exp(b, n / 2) and (exp(b, (n - 1) / 2). Remember that you don't need to do anything special to square a number, just calculate the value and multiply it by itself. So don't cheat and use exponentiation in your solution.

# # Suggestion: Break the methods down into parts.. Accessing this on GitHub? Use this link.

# # Suggestion 2: Try walking through your code with Simple Examples.

# # If the n == 256, about how many nested recursive steps will we run in the first case?

# # How deep will we need to recurse for the second? Keep in mind that the first reduces the exponent by one for each recursion, while the second reduces it by half.

# # In addition to testing your methods by running the code, try the following exercise:

# # On paper, write out the value of each variable for every line in the code:

# # Write out what happens with base 0 and power 0 as inputs (should be easy). e.g., if you had run exp(0,0).
# # Write out what happens for base 0 and power 1. e.g., if you had run exp(0,1).
# # Write out what happens for base 1 and power 0.
# # Write out what happens for base 1 and power 1.
# # Write out what happens for base 1 and power 2.
# # Write out what happens for base 2 and power 0.
# # Write out what happens for base 2 and power 1.
# # Write out what happens for base 2 and power 2.
# # Make sure you can trace from the very beginning to the very end in these examples.

# # How many examples do you need to walk through to be confident that it works?






# # # # recursion 1
# # # exp(b, 0) = 1
# # # exp(b, n) = b * exp(b, n - 1)


# # def exp1(b, n)
# #   return 1 if n <= 0
# #   b * exp1(b, n - 1)
# # end

# # # # => (2, 3)
# # # 2 * exp1(2, 2)
# # # 2 * 2 * exp1(2, 1)
# # # 2 * 2 * 2 * exp1(2,0)

# # # # => (1, 0)

# # # 1 * exp(1, -1)
# # # 1 * 1



# # def exp2(b, n)
# #   return 1 if n <= 0

# #   if n.even?
# #     exp2(b, n/2) * exp2(b, n/2)
# #   elsif n.odd?
# #     b * exp2(b, (n - 1)/2) * exp2(b, (n - 1)/2)
# #   end
# # end


# # # exp(2,3)

# # 2 * exp2(2, 1) * exp2(2,1)
# # 2 * 2 * exp2(2,0) * exp2(2,0) * 2 * exp2(2,0) * exp2(2,0)


# # # exp(1,1)
# # 1 * exp2(1, 1) * exp2(1, 1)
# # 1 * 1 * 1





# # # => exp(1,1)
# # 1 * exp2(1,0)
# # 1 * 1

# # # => exp(2,2)
# # 2 * exp2(2, 1)
# # 2 * 2 * exp2(2, 0)

# # # => exp(2,3)
# # 2 * exp(2, 2)
# # 2 * 2 * exp(2, 1)
# # 2 * 2 * 2 * exp(2,0)
# # 2 * 2 * 2 * 1

# # # => exp(2, 2)
# # 2 * exp(2,1)
# # 2 * 2 * exp(2,0)

# # # exp(2,3)
# # 2 * exp2(2, 1)
# # 2 * 2 * exp2(2, 0)









# # Deep dup
# # The #dup method doesn't make a deep copy:

# # robot_parts = [
# #   ["nuts", "bolts", "washers"],
# #   ["capacitors", "resistors", "inductors"]
# # ]

# # robot_parts_copy = robot_parts.dup

# # # shouldn't modify robot_parts
# # robot_parts_copy[1] << "LEDs"
# # # but it does
# # robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]
# # When we dup an Array, it creates a new array to hold the elements, but doesn't recursively dup any arrays contained therein. So the dup method creates one new array, but just copies over references to the original interior arrays.

# # Sometimes you want a shallow dup and sometimes you want a deep dup. Ruby keeps things simple by giving you shallow dup, and letting you write deep dup yourself.

# # Using recursion and the is_a? method, write an Array#deep_dup method that will perform a "deep" duplication of the interior arrays.

# # Note: For simplicity's sake, we are only going to ensure the deep duplication of arrays. Don't worry about deep-duping (or regular-duping) other types of mutable objects (like strings, hashes, instances of custom classes, etc.), since this would require that we implement a deep dup method for each of those classes, as well.

# # It's okay to iterate over array elements using the normal each for this one :-)

# # You should be able to handle "mixed" arrays. For instance: [1, [2], [3, [4]]].



# # robot_parts = [
# #   ["nuts", "bolts", "washers"],
# #   ["capacitors", "resistors", "inductors"]
# # ]


# # # EXAMPLE => [1,[2],[3,[4]]]

# # # SIMPLE EXAMPLE => [1,2,3]
# # def deep_dup(arr)
# #   output = []
# #   arr.each do |el|
# #     if el.is_a?(Array)
# #       output << deep_dup(el)
# #     else
# #       output << el
# #     end
# #   end
# #   output
# # end



# # # If el.is_a?(Array)
# # # call deep_dup






# # MAX_STACK_SIZE = 200
# # tracer = proc do |event|
# #   if event == 'call' && caller_locations.length > MAX_STACK_SIZE
# #     fail "Probable Stack Overflow"
# #   end
# # end
# # set_trace_func(tracer)






# # # Fibonacci
# # # Write a recursive and an iterative Fibonacci method. The method should take in an integer n and return the first n Fibonacci numbers in an array.

# # # You shouldn't have to pass any arrays between methods; you should be able to do this just passing a single argument for the number of Fibonacci numbers requested.



# # # EXAMPLE => (5) => [0, 1, 1, 2, 3]

# # # RECURSIVE
# # def fib1(n)
# #   return [0,1].slice(0,n) if n <= 2
# #   fib1(n - 1) << fib1(n - 1).slice(-2,2).sum
# # end


# # # fib(3)
# # output << fib1(2).sum # => [0,1,1]
# # # fib(4)
# # output << fib1(3).slice(-2,2).sum # => [0,1,1,2]
# # # fib(5)
# # output << fib1(4).slice(-2,2).sum # => [0,1,1,2,3]

# # # fib(4)
# # fib(1 - 1) + fib(1 - 2)
# # 0 + 0
# # output  = [0]
# # output << fib(1) + fib(0)
# # output << 0 + 
# # 1 + 0
# # fib()



# # # fib1(3)
# # fib(3) = fib(2) + fib(1)
# # fib(3) = 

# # output << 





# # # ITERATIVE
# # def fib2(n)
# #   output = [0,1]
# #   output.slice(0, n) if n <= 2
  
# #   (n - 2).times do
# #     output << output.slice(-2, 2).sum
# #   end

# #   output
# # end













# # Binary Search
# # The binary search algorithm begins by comparing the target value to the value of the middle element of the sorted array. If the target value is equal to the middle element's value, then the position is returned and the search is finished. If the target value is less than the middle element's value, then the search continues on the lower half of the array; or if the target value is greater than the middle element's value, then the search continues on the upper half of the array. This process continues, eliminating half of the elements, and comparing the target value to the value of the middle element of the remaining elements - until the target value is either found (and its associated element position is returned), or until the entire array has been searched (and "not found" is returned).

# # Write a recursive binary search: bsearch(array, target). Note that binary search only works on sorted arrays. Make sure to return the location of the found object (or nil if not found!). Hint: you will probably want to use subarrays.

# # Make sure that these test cases are working:

# # bsearch([1, 2, 3], 1) # => 0
# # bsearch([2, 3, 4, 5], 3) # => 1
# # bsearch([2, 4, 6, 8, 10], 6) # => 2
# # bsearch([1, 3, 4, 5, 9], 5) # => 3
# # bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# # bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# # bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

# # [1,2,3,4,5,6,7]
# # def bsearch(array, target)
# #   if array.length == 1
# #     return array[0] == target ? 0 : nil
# #   end

# #   mid_index = array.length / 2

# #   if target < array[mid_index]
# #     bsearch(array[0...mid_index], target)
# #   else
# #     right = bsearch(array[mid_index..-1], target)
# #     return nil if right == nil
# #     mid_index + right
# #   end
# # end

# # # [1], 1
# # # [1,2], 1
# # # [1,2], 2
# # def bsearch(arr, target)
# #   if arr.length == 1 && arr[0] == target
# #     return 0
# #   elsif arr.length == 1 && arr[0] != target
# #     return nil
# #   end

# #   mid_idx = arr.length / 2

# #   if target < arr[mid_idx]
# #     bsearch(arr[0...mid_idx], target)
# #   else
# #     right = bsearch(arr[mid_idx..-1], target)
# #     return nil if right == nil
# #     mid_idx + right
# #   end
# # end






























# # def bsearch(arr, target)
# #   if arr.length == 1
# #     return arr[0] == target ? 0 : nil
# #   end

# #   mid = arr.length / 2

# #   if target < arr[mid]
# #     bsearch(arr[0...mid], target)
# #   else
# #     right = bsearch(arr[mid..-1], target)
# #     return nil if right == nil
# #     mid + right
# #   end
# # end





































# # p bsearch([1, 2, 3], 1) # => 0
# # p bsearch([2, 3, 4, 5], 3) # => 1
# # p bsearch([2, 4, 6, 8, 10], 6) # => 2

# # p bsearch([1, 3, 4, 5, 9], 5) # => 3
# # p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# # p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# # p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil







# # midpoint = (arr.length - 1) / 2


















# # Merge Sort
# # Implement a method merge_sort that sorts an Array:

# # The base cases are for arrays of length zero or one. Do not use a length-two array as a base case. This is unnecessary.
# # You'll want to write a merge helper method to merge the sorted halves.
# # To get a visual idea of how merge sort works, watch this gif and check out this diagram.






# # Conceptually, a merge sort works as follows:

# # Divide the unsorted list into n sublists, each containing one element (a list of one element is considered sorted).

# # Repeatedly merge sublists to produce new sorted sublists until there is only one sublist remaining. This will be the sorted list.




# # def ms(arr)
# #   return arr if arr.length <= 1

# #   mid = arr.length / 2
# #   left = ms(arr[0...mid])
# #   right = ms(arr[mid..-1])
  
# #   merge(left, right)
# # end

# # def merge(left, right)
# #   output = []

# #   until left == [] || right == []
# #     if left[0] < right[0]
# #       output << left.shift
# #     else
# #       output << right.shift
# #     end
# #   end

# #   output.concat(left).concat(right)
# # end

# # ms([10,9,8,7,6,5,4,3,2,1])

# # # [9,8,7,6,5,4,3,2,1]






# # Array Subsets
# # Write a method subsets that will return all subsets of an array.

# # subsets([]) # => [[]]
# # subsets([1]) # => [[], [1]]
# # subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# # subsets([1, 2, 3])
# # # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
# # You can implement this as an Array method if you prefer.

# # Hint: For subsets([1, 2, 3]), there are two kinds of subsets:

# # Those that do not contain 3 (all of these are subsets of [1, 2]).
# # For every subset that does not contain 3, there is also a corresponding subset that is the same, except it also does contain 3.





# # def subsets(arr)
# #   debugger
# #   return [[]] if arr.length <= 0

# #   old_subsets = subsets(arr.drop(1))
# #   new_subsets = []
# #   old_subsets.each do |subset|
# #     new_subsets << subset + [arr.first]
# #   end
# #   old_subsets + new_subsets
# # end











# # def subsets(arr)
# #   return [[]] if arr.length <= 0

# #   old_subsets = subsets(arr.drop(1))
# #   new_subsets = []
# #   old_subsets.each do |subset|
# #     new_subsets <<  [arr.first] + subset
# #   end
# #   old_subsets + new_subsets
# # end

























# # p subsets([1,2,3])










# # Permutations
# # Write a recursive method permutations(array) that calculates all the permutations of the given array. For an array of length n there are n! different permutations. So for an array with three elements we will have 3 * 2 * 1 = 6 different permutations.

# # permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
# #                         #     [2, 1, 3], [2, 3, 1],
# #                         #     [3, 1, 2], [3, 2, 1]]
# # You can use Ruby's built in Array#permutation method to get a better understanding of what you will be building.

# # [1, 2, 3].permutation.to_a  # => [[1, 2, 3], [1, 3, 2],
# #                             #     [2, 1, 3], [2, 3, 1],
# #                             #     [3, 1, 2], [3, 2, 1]]



# # def permutations(arr)
# #   debugger
# #   return [arr] if arr.size < 2

# #   el = arr[0]
# #   output = permutations(arr[1..-1]).each_with_object([]) do |perm, result|
# #     (0..perm.size).each {|i| result << perm.dup.insert(i, el)}
# #   end

# #   output
# # end

# # p permutations([1,2,3])


# ###################################
# # Key concepts
# # each_with_object
# # dup
# # insert
# ###################################


# # # [1,2,3]

# # el = 1
# # permutations([2, 3]).each_with_object([]) do |perm, result|
# #   (0..perm.size).each {|i| result << perm.dup.insert(i, el)}
# # end

# # [2]

# # permutation([3])





# # # [1, 2, 3]
# # # [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]

# # 123
# # 132

# # 231
# # 213

# # 312
# # 321











# # Make Change
# # RubyQuiz: Make change.

# # Here's a game plan for solving the problem:

# # First, write a 'greedy' version called greedy_make_change:

# # Take as many of the biggest coin as possible and add them to your result.
# # Add to the result by recursively calling your method on the remaining amount, leaving out the biggest coin, until the remainder is zero.
# # Once you have a working greedy version, talk with your partner about refactoring this to make_better_change. What's wrong with greedy_make_change?

# # Consider the case of greedy_make_change(24, [10,7,1]). Because it takes as many 10 pieces as possible, greedy_make_change misses the correct answer of [10,7,7] (try it in pry).

# # To make_better_change, we only take one coin at a time and never rule out denominations that we've already used. This allows each coin to be available each time we get a new remainder. By iterating over the denominations and continuing to search for the best change, we assure that we test for 'non-greedy' uses of each denomination.

# # Discuss the following game plan and then work together to implement your new method:

# # Iterate over each coin.
# # Grab only one of that one coin and recursively call make_better_change on the remainder using coins less than or equal to the current coin.
# # Add the the single coin to the change returned by the recursive call. This will be a possible solution, but maybe not the best one.
# # Keep track of the best solution and return it at the end.
# # N.B. Don't generate every possible permutation of coins and then compare them. Remember that a permutation is not the same thing as a combination - we will need to check every combination of coins that add up to our target, we just don't want to check the same combination in different orders. If you get stuck you can start by writing a solution that calculates and compares all of the permutations without storing them in an array. Then go back and refactor your solution so that it only calculates and compares all of the different combinations. If you and your partner get totally stuck, or would like to compare your answer, feel free to reference this video walkthrough of the problem.

# # Make sure you and your partner understand each line before moving on.



# def make_change(amount, coins = [25,10,5,1])
#   debugger
#   change = coins.sort.reverse.map do |coin| 
#     f = amount/coin
#     amount %= coin
#     Array.new(f){coin}
#   end
#   change.flatten
# end


# p make_change(47, coins = [25,10,5,1])




































# def make_change(amount, coins = [1,5,10,25])
#   coin_subarrays = coins.sort.reverse.map do |coin|
#     num_of_coin = amount / coin
#     amount %= coin
#     Array.new(num_of_coin) {coin}
#   end
#   coin_subarrays.flatten

# end

# p make_change(99, coins = [1,5,10,25])


  # # 99
  # # [25,10,5,0]

  # num_of_coin = amount / coin # => 99 / 25 => 3
  # amount -= coin # => 99 % 25 = 24
  # Array.new(3) {coin}
  
  # # [[25, 25, 25]]

  # num_of_coin = 24 / 10 # => 4
  # amount %= coin # => 4
  # Array.new(4) {coin}
  # # [[25, 25, 25], [10, 10, 10, 10]]

  # num_of_coin = 4 / 5 # => 0
  # amount %= coin # => 4
  # Array.new(0) {coin}
  # # [[25, 25, 25], [10, 10, 10, 10], []]

  # num_of_coin = 4 / 1 # => 4
  # amount %= coin # => 0
  # Array.new(4) {coin}

  # # [[25, 25, 25], [10, 10, 10, 10], [], [1,1,1,1]]




# def make_change(total, coins = [25, 10, 5, 1])
#   greedy_coins = coins.sort.reverse.map do |coin|
#     num_coins = total / coin # => 3
#     total %= coin
#     Array.new(num_coins) {coin}
#   end
#   greedy_coins.flatten
# end




# Iterative
# def make_change(total, coins=[25,10,5,1])
#   total_coins = coins.sort.reverse.map do |coin|
#     num_coins = total / coin
#     total %= coin
#     Array.new(num_coins) {coin}
#   end
#   total_coins.flatten
# end

# p make_change(99, coins = [25,10,5,1])


# Recursive
# def make_change(total, coins = [25, 10, 5, 1])
#   output = []

#   first_coin = coins[0]

#   if total >= first_coin
#     output << first_coin
#     total -= first_coin
#   else
#     coins = coins.drop(1)
#   end

#   if total > 0
#     output = output + make_change(total, coins)
#   end

#   output
# end

# p make_change(99, coins = [25, 10, 5, 1])


# Wonky coins

# def make_change(total, coins = [10,7,1]) # => 14
#   return [] if total == 0

#   best_coins = nil
  
#   coins.each do |coin|
#     next if coin > total

#     change_for_rest = make_change(total - coin, coins)
#     change = [coin] + change_for_rest

#     if best_coins.nil? || change.length < best_coins.length
#       best_coins = change
#     end
#   end
  
#   best_coins
# end































# def make_change(total, coins = [10, 7, 1])  # => 14 => [7,7]
#   return [] if total == 0

#   best_coins = nil

#   coins.each do |coin|
#     next if total < coin

#     change = [coin] + make_change(total - coin, coins)

#     if best_coins.nil? || best_coins.length > change.length
#       best_coins = change
#     end
#   end

#   best_coins
# end





























# def make_change(total, coins = [10, 7, 1])
#   return [] if total == 0

#   best_set = nil

#   coins.each do |coin|
#     next if total < coin

#     change = [coin] + make_change(total - coin, coins)

#     if best_set.nil? || best_set.length > change.length
#       best_set = change
#     end
#   end

#   best_set
# end




























# p make_change(14, coins = [10,7,1])
# [25,25,25,10,10]


# 24
# [10,5,1]

# 4
#  [5,1]

# 4
# [1]

# def make_change(total, coins = [25, 10, 5, 1])
#   change = []

#   # debugger
#   first_coin = coins[0]
#   if total >= first_coin
#     change << first_coin
#     total -= first_coin
#   else
#     coins = coins.drop(1)
#   end
  
#   if total > 0
#     change = change + make_change(total, coins)
#   end
#   change
# end


# def make_change(total, coins = [25, 10, 5, 1])
#   return [] if total == 0
  
#   best_change = nil

#   coins.each do |coin|
#     next if coin > total

#     change_for_rest = make_change(total - coin, coins)
#     change = [coin] + change_for_rest

#     if best_change.nil? || change.count < best_change.count
#       best_change = change
#     end
#   end

#   best_change
# end



# # p make_change(99, coins = [25,10,5,1])
# p make_change(14, coins = [10, 7, 1])

# # Best of:
# [10] + make_change(4)
# [7] + make_change(7)
# [1] + make_change(13)

















# add one to array
# => [1,2,3] => [1,2,4]
# => [9,9,9] => [1,0,0,0]

# def add_one(arr)
#   arr = arr.dup
#   carry = 1

#   (arr.length - 1).downto(0).each do |i|
#     arr[i] += carry
#     if arr[i] == 10
#       arr[i] = 0
#       carry = 1
#     else
#       carry = 0
#     end
#   end

#   arr.unshift(carry) if carry == 1
#   arr
# end



# p add_one([9,9,9])






















# recursive  

# (1,5) => [1,2,3,4]

# (1, 2) => [1]

def range(a, b)
  return [] if b - a <= 0
  [a] + range(a + 1, b)
end
# p range(1,5)

# iterative
def sum_arr1(arr) # => [1,2] => 3
  return 0 if arr.empty? 
  arr[0] + sum_arr1(arr[1..-1])
end
# p sum_arr1([1,2,3,4])


# iterative
def sum_arr2(arr)
  total = 0
  arr.each do |el|
    total += el
  end
  total
end
# p sum_arr2([1,2,3,4])

# recursive  
# => (0, 0)
# => (1, 0)
# => (1, 1)
# => (2, 2)
# => (2, 3)
def exp1(b, n)
  return 1 if n <= 0
  b * exp1(b, n - 1)
end
# p exp1(2,3)



# recursive (divide n / 2 each time)

# => (2, 3)
def exp2(b, n)
  return 1 if n <= 0

  debugger
  if n.even?
    exp2(b, n/2) * exp2(b, n/2)
  else
    b * exp2(b, (n - 1) / 2) * exp2(b, (n - 1) / 2)
  end
end

# p exp2(2,4)





def deep_dup(arr)
  output = []

  arr.each do |el|
    if !el.is_a?(Array)
      output << el
    else
      output << deep_dup(el)
    end
  end
  output
end
# p deep_dup([1, [2], [3, [4]]])
# [1, [2], [3, [4]]]
# [1, [2], 3, [4]]]




# fib(2) => [0,1]
# fib(3) => [0,1,1]
# fib(4) => [0,1,1,2]

def fib(n)
  return [0, 1].slice(0, n) if n <= 2

  fib(n - 1) + [fib(n - 1)[-2..-1].sum]

end

# p fib(15)






# bs([1,2,3,4,5,6,7], target)

# def bs(arr, target)
#   debuggerlear

#   if arr.length == 1
#     return target == arr[0] ? 0 : nil
#   end

#   mid = arr.length / 2

#   if target < arr[mid]
#     bs(arr[0...mid], target)
#   else
#     offset = bs(arr[mid..-1], target)
#     return nil if offset == nil
#     mid + offset
#   end
# end

# p bs([1,4,5,7,87,957], 9999)
# # ([1,2], 2)





# # def bsearch(arr, target)
# #   if arr.length == 1
# #     return arr[0] == target ? 0 : nil
# #   end

# #   mid = arr.length / 2

# #   if target < arr[mid]
# #     bsearch(arr[0...mid], target)
# #   else
# #     right = bsearch(arr[mid..-1], target)
# #     return nil if right == nil
# #     mid + right
# #   end
# # end














# range
# range(1,5) => [1,2,3,4]

# def range(a, b)
#   return [] if b - a <= 0
#   [a] + range(a + 1, b)
# end

# # p range(1,10)






# sum([1,2,3,4,5]) => 15

# def sum(arr)
#   return 0 if arr.length < 1
#   arr[0] + sum(arr[1..-1])
# end

# p sum([1,2,3,4,5,6,7,8,9,10])



# # sum([1,2,3,4,5]) => 15
# def sum(arr)
#   sum = 0
#   arr.each do |num|
#     sum += num
#   end
#   sum
# end
# # p sum([1,2,3,4,5,6,7,8,9,10])












# exp(1, 0) => 1
# exp(0, 0) => 0
# exp(2, 2) => 4
# exp(2, 3) => 8

# def exp(b, n)
#   return 1 if n <= 0
#   b * exp(b, n-1)
# end



# # exp(2, 4)
# def exp(b, n)
#   return 1 if n <= 0

#   if n.even?
#     exp(b, n/2) * exp(b, n/2)
#   else
#     b * exp(b, (n-1)/2) * exp(b, (n-1)/2)
#   end
# end

# p exp(2, 5)
# # exp(2, 1) * exp(2, 1) * exp(2, 1) * exp(2, 1)
# # 2 * 1 * 2 * 1 * 2 * 1 * 2 * 1
# # 2 * exp(2, 2) * exp(2, 2)





# # deep_dup([1, [2], [3, [4]]]) => [1, [2], [3, [4]]]
# def deep_dup(arr)
#   output = []

#   arr.each do |el|
#     if el.is_a?(Array)
#       output << deep_dup(el)
#     else
#       output << el
#     end
#   end

#   output
# end

# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]
# p deep_dup(robot_parts)






# # fib(3) => [0,1,1]
# # fib(4) => [0,1,1,2]

# def fib(n)
#   return [0,1].slice(0, n) if n <= 2
#   fib(n - 1) << fib(n-1).last(2).sum
# end

# p fib(4)
# p fib(5)
# p fib(6)
# p fib(7)
# p fib(8)

# # fib(2) => [0,1]


# def fib(n)
#   return [0,1].slice(0, n) if n <= 2
#   seq = [0,1]
#   (n - 2).times {seq << seq.last(2).sum} 
#   seq
# end


# p fib(4)
# p fib(5)
# p fib(6)
# p fib(7)
# p fib(8)












# [1,2,3,4,5], 2 => 1
# [1,2,3,4,5], 3 => 2
# [1,2,3,4,5], 5 => 4
# [1,2,3,4,5], 6 => nil

# def bs(arr, target)
#   if arr.length == 1
#     return arr[0] == target ? 0 : nil
#   end

#   mid = arr.length / 2

#   if target < arr[mid]
#     bs(arr[0...mid], target)
#   else
#     # debugger
#     offset = mid
#     return nil if bs(arr[mid..-1], target) == nil
#     offset + bs(arr[mid..-1], target)
#   end

# end


# p bs([1,2,3,4,5,6,7,8,9,10], 1)








# def ms(arr)
#   # debugger
#   return arr if arr.length <= 1

#   mid = arr.length / 2
#   left = arr[0...mid]
#   right = arr[mid..-1]

#   merge(ms(left), ms(right))
# end

# def merge(a, b)
#   output = []

#   until a == [] || b == []
#     if a[0] < b[0]
#       output << a.shift
#     else
#       output << b.shift
#     end
#   end

#   output.concat(a).concat(b)
# end


# p ms([6,5,4,3,7,8,9,2,0,1])











# def subsets(arr)
#   return [[]] if arr.length <= 0

#   old_set = subsets(arr.drop(1))
#   new_set = []
#   old_set.each do |set|
#     new_set << [arr.first] + set
#   end
#   old_set + new_set
# end

# p subsets([1,2,3])








# def perm(arr)
#   return [arr] if arr.length < 2

#   el = arr[0]
#   perm(arr[1..-1]).each_with_object([]) do |perms, result|
#     (0..perms.size).each do |i|
#       result << perms.dup.insert(i, el)
#     end
#   end
# end

# p perm([1,2,3])


# perm([1,2,3]) => # => [[1, 2, 3], [1, 3, 2],
                  #     [2, 1, 3], [2, 3, 1],
                  #     [3, 1, 2], [3, 2, 1]]





# # def permutations(arr)
# #   debugger
# #   return [arr] if arr.size < 2

# #   el = arr[0]
# #   output = permutations(arr[1..-1]).each_with_object([]) do |perm, result|
# #     (0..perm.size).each {|i| result << perm.dup.insert(i, el)}
# #   end

# #   output
# # end

# # p permutations([1,2,3])






























# # [0,1]

# el = 0

# # perm([1]).each_with_object
# [[1]].each_with_object([]) do |el, result|
#   # (0..el.length)
#   (0, 1).each do |i|
#     el.dup.insert(i, el)
#   end
#   # => [0,1], [1,0]
#   # => [[0,1],[1,0]]
# end







# def perm(arr)
#   return [arr] if arr.length < 2

#   el = arr[0]
#   perm(arr[1..-1]).each_with_object([]) do |current, result|
#     (0..current.size).each do |i|
#       result << current.dup.insert(i, el)
#     end
#   end
# end

# p perm([1,2,3])



# # perm([1,2,3])
 
# #1
# el = 1
# [[2,3],[3,2]].each_with_object([]) do |cur, result|
#   (0..cur.size).each do |i|
#     # result << cur.dup.insert(i, el)
#     result << cur.dup.insert(0, 1)   # => [1,2,3]
#     result << cur.dup.insert(1, 1)   # => [2,1,3]
#     result << cur.dup.insert(2, 1)   # => [2,3,1]
#     result << cur.dup.insert(0, 1)   # => [1,3,2]
#     result << cur.dup.insert(1, 1)   # => [3,1,2]
#     result << cur.dup.insert(2, 1)   # => [3,2,1]
#   end
# end

# el = 2
# # perm([3]).each_with_object  #2
# [[3]].each_with_object([]) do |cur, result|
#   (0..cur.size).each do |i|
#     # cur.dup.insert(i, el)
#     cur.dup.insert(0, 2) # => [2,3]
#     cur.dup.insert(1, 2) # => [3,2]
#   end
# end
# # => [[2,3],[3,2]]










# def perm(arr)
#   return [arr] if arr.size < 2

#   el = arr[0]
#   perm(arr[1..-1]).each_with_object([]) do |cur, result|
#     (0..cur.size).each do |i|
#       result << cur.dup.insert(i, el)
#     end
#   end
# end

# p perm([1,2,3,4,5])








# def make_change(target, coins=[25,10,5,1])

#   change = coins.sort.reverse.map do |coin|
#     next if coin > target
#     num_coins = target / coin
#     target %= coin
#     Array.new(num_coins) {coin}
#   end
#   change.reject {|el| el.nil?}.flatten
# end

# p make_change(99, coins=[25,10,5,1])













# def make_change(target, coins=[25,10,5,1])

#   change = []

#   until target <= 0
#     first_coin = coins[0]
#     if target >= first_coin 
#       change << first_coin
#       target -= first_coin
#     else
#       coins = coins.drop(1)
#     end
#   end
  
#   change
# end


# p make_change(99, coins=[25,10,5,1])





# def make_change(target, coins=[10,7,1])
#   return [] if target <= 0

#   best_change = nil
#   coins.each do |coin|
#     next if target < coin
#     current_set = [coin] + make_change(target - coin, coins)

#     if best_change.nil? || best_change.count > current_set.count
#       best_change = current_set
#     end
#   end

#   best_change
# end

# p make_change(14, coins=[10,7,1])

# current_set = 10 + make_change(7, coins)


# coins[0] + make_change(target, coins=[10,7,1])











# def make_change(target, coins=[10,7,1])
#   return [] if target <= 0

#   best_change = nil

#   coins.each do |coin|
#     next if target < coin

#     current_best = [coin] + make_change(target - coin, coins)

#     if best_change.nil? || best_change.count > current_best.count
#       best_change = current_best
#     end
#   end

#   best_change
# end

# p make_change(14, coins=[10,7,1]) # => [7,7]














































































































# => range(1, 5) => [1, 2, 3, 4]
def range(a, b)
  return [] if b - a <= 0
  [a] + range(a + 1, b)
end

# p range(1, 5)

# recursive
# => [1,2,3,4,5] => 15
def sum(arr)
  return 0 if arr.length <= 0
  arr[0] + sum(arr[1..-1])
end

# p sum([1,2,3,4,5])

# => [1,2,3,4,5] => 15
# iterative
def sum(arr)
  sum = 0

  arr.each do |el|
    sum += el
  end
  sum
end
# p sum([1,2,3,4,5])

# exp(1,0) => 1
# exp(0,0) => 0 * 1
# exp(2,2) => 2 * 2 * 1
# recursive + decrement by 1
def exp(b, n) # => b ** n
  return 1 if n <= 0
  b * exp(b, n - 1)
end

# p exp(2,200)
# p exp(2,4)


# # recursive + decrement by 1/2
# exp(1,0) => 1
# exp(0,0) => 0 * 1
# exp(2,2) => 2 * 2 * 1
# exp(2,3) => 2 * 2 * 2 => 8
# exp(2,4) => 2 * 2 * 2 * 2=> 16
def exp(b, n)
  return 1 if n <= 0 

  if n.even?
    exp(b, n/2) * exp(b, n/2)
  else
    b * exp(b, (n-1)/2) * exp(2, (n-1)/2)
  end
end

# p exp(2, 5)


# [1,2,[3,[4]]]

def deep_dup(arr)
  return [] if arr.length <= 0
  dup = []
  arr.each {|el| el.is_a?(Array) ? dup << deep_dup(el) : dup += [el]}
  dup
end

# p deep_dup([1,2,[3,[4, [5, [6, [7, [8]]]]]]])


# Example fibonacci sequence 
# [0,1,1,2,3,5,8,13,21,34]
def fib(n)
  return [0,1].slice(0, n) if n <= 2
  fib(n-1) + [fib(n-1)[-2..-1].sum]
end

# p fib(10)

# fib(2) + [fib(2).slice(-2, -1).sum]
# fib(2) + [3]

def bs(arr, target)
  return 0 if target == arr[0]
  return nil if target > arr.last

  mid = arr.length / 2 # => 2

  if target < arr[mid]
    bs(arr[0...mid], target)
  else
    left_offset = mid
    left_offset + bs(arr[mid..-1], target)
  end

end

# p bs([1,2,3,4,5], 3)
# 2 + 1 + 1 + nil 

def ms(arr)
  return arr if arr.length <= 1

  mid = arr.length / 2
  left = arr[0...mid]
  right = arr[mid..-1]

  merge(ms(left), ms(right))
end

def merge(a, b)
  merged = []

  until a == [] || b == []
    if a[0] < b[0]
      merged << a.shift
    else
      merged << b.shift
    end
  end

  merged.concat(a).concat(b)
end

# p ms([6,5,4,7,8,9,3,2,1,0])

def subsets(arr)
  return [[]] if arr.length <= 0

  old_set = subsets(arr.drop(1))
  new_set = []
  old_set.each do |el|
    new_set << [arr.first] + el
  end
  old_set + new_set
end

# [1, 2]
# old = subsets(arr.drop(1))
# old = subsets([2]
# new = []
# old = [[], [2]]
# [[], [2]].each do |el|
#   new << [arr.first] + el
# end
# old + new

# p subsets([1,2,3,4,5,6,7,8,9,10])
# [1,2]
# => [[], [1], [2], [1, 2]]

# perm([1,2]) => [[1,2], [2,1]]
# perm([1,2,3]) => [[1,2,3], [2,1,3], [2,3,1], [], [], []]
# def perm(arr)
#   return [arr] if arr.length <= 1

#   first_el = arr[0]
#   permutations = []
#   perm(arr[1..-1]).each_with_object([]) do |cur, result|
#     (0...arr.length).each do |i|
#       permutations << cur.dup.insert(i, first_el)
#     end
#   end
#   permutations
# end


# [1,2,3]
def perm(arr)
  return [arr] if arr.length <= 1

  first_el = arr[0]
  cur_set = []
  perm(arr[1..-1]).each_with_object([]) do |set, result|
    (0...arr.length).each do |i|
      cur_set << set.dup.insert(i, first_el)
    end
  end
  cur_set
end

# [[3]]
# [[2,3], [3,2]]


# [2,3] 1
# [3] 2

# [[1,2,3],[2,1,3],[2,3,1],[1,3,2],[3,1,2],[3,2,1]]


# p perm([1,2,3])



# v1 - iterative solution
def make_change(target, coins)
  change = []

  until target <= 0
    coins.each do |coin|
      next if target < coin

      num_coins = target / coin
      target %= coin
      change << Array.new(num_coins) {coin}
    end
  end
  change.flatten
end




# # v2 - recursive solution
# def make_change(target, coins)
#   return [] if target <= 0

#   best_change = nil
#   coins.each do |coin|
#     next if target < coin

#     current = [coin] + make_change(target - coin, coins)

#     if best_change.nil? || best_change.count > current.count
#       best_change = current
#     end
#   end
#   best_change
# end


# target - coin + make_change(coins)








# def make_change(target, coins=[10,7,1])
#   return [] if target <= 0

#   best_change = nil

#   coins.each do |coin|
#     next if target < coin

#     current_change = [coin] + make_change(target - coin, coins)

#     if best_change.nil? || current_change.count < best_change.count
#       best_change = current_change
#     end
#   end
#   best_change
# end


# p make_change(14, coins=[10,7,1]) # => [7, 7]


# # linear time solution
# def sum?(arr, target)
#   hash = Hash.new(nil)
  
#   arr.each do |el|
#     if hash[target - el] == true
#       return true
#     else
#       hash[el] = true
#     end
#   end
#   false
# end

# p sum?([1,4,7,7,7,5,4,2,2,4,4,65,76,3,2], 66) # => true
# p sum?([1,4,7,7], 10) # => false



def perm(arr)
  return [arr] if arr.length <= 1

  first_el = arr.first

  permutations = []
  perm(arr[1..-1]).each_with_object([]) do |current, result|
    (0...arr.length).each do |i|    
      permutations << current.dup.insert(i, first_el)
    end
  end
  permutations
end

# first_el = 1
# [[2]].each_with_object
# permutations = [[1,2], [2,1]]

# p perm([1,2,3])
# [1,2] => [[1,2],[2,1]]



# [1,2] => [[], [1], [2], [1,2]]
def subsets(arr)
  return [[]] if arr.length <= 0

  old = subsets(arr[1..-1])
  new = []
  old.each do |set|
    new << [arr.first] + set
  end
  old + new
end

# p subsets([1,2,3])



# iterative
def make_change(target, coins)
  return [] if target <= 0

  first = coins.first

  if target >= first
    new_target = target - first
    [first] + make_change(new_target, coins)
  else
    make_change(target, coins.drop(1))
  end
end

p make_change(99, coins=[25,10,5,1])

# recursive
def make_change(target, coins)
end




































# def make_change(target, coins=[10,7,1])
#   return [] if target <= 0

#   best_change = nil
#   coins.each do |coin|
#     next if target < coin

#     current = [coin] + make_change(target - coin, coins)

#     if best_change.nil? || best_change.count > current.count
#       best_change = current
#     end
#   end
#   best_change
# end

# p make_change(28, coins=[10,7,1])













































































































