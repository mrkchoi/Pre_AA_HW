

















def rob(nums)
  return 0 if nums.nil? || nums.empty?
  return nums.first if nums.length == 1
  return [nums.first, nums.last].max if nums.length == 2

  dp = Array.new(nums.length)

  dp[0] = nums[0]
  dp[1] = [nums[0], nums[1]].max

  i = 2
  while i < dp.length
    dp[i] = [nums[i] + dp[i - 2], dp[i - 1]]
    
    i += 1
  end

  dp[nums.length - 1].flatten.max
end

# p rob([2,1,1,2,21,3,4,6,8,56,1,2,4,5,3,9])






# # Recursive, Inefficient solution
# def fib(n)
#   if n == 1 || n == 2
#     result = 1 
#   else
#     result = fib(n - 1) + fib(n - 2)
#   end

#   result  
# end

# # Memoized Solution
# def fib2(n, memo)
#   if !memo[n].nil?
#     return memo[n]
#   end

#   if n == 1 || n == 2
#     result = 1
#   else
#     result = fib(n-1, memo) + fib(n-2, memo)
#   end
#   memo[n] = result
#   return result
# end

# Bottom up approach (dynamic programming)
def fib_bottom_up(n)
  return 1 if n == 1 || n == 2
  bottom_up = []
  bottom_up[1] = 1
  bottom_up[2] = 1
  (3..n).each do |i|
    bottom_up[i] = bottom_up[i - 1] + bottom_up[i - 2]
  end
  bottom_up[n]
end




# p fib(5, Array.new(5))
# p fib(100, Array.new(100))
p fib_bottom_up(1)
p fib_bottom_up(2)
p fib_bottom_up(3)
p fib_bottom_up(4)
p fib_bottom_up(5)
p fib_bottom_up(10)
p fib_bottom_up(100)
p fib_bottom_up(10000)
# p fib(5, Array.new(5))
# p fib(6)
# p fib(7)
# p fib(8)
# p fib(9)
# p fib(100)























































































































































































































































































































