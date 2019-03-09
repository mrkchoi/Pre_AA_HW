# doubler = Proc.new {|num| num * 2}

# p doubler.call(100)


# is_even = Proc.new do |num|
#     if num % 2 == 0
#         true
#     else
#         false
#     end
# end

# p is_even.call(12)

# doubler = Proc.new {|num| num * 2}
# p [1,2,3].map(&doubler)


# sum = Proc.new {|a,b| a + b}

# p sum.call(10, 1)



# def add_and_proc(num1, num2, prc)
#     sum = num1 + num2
#     prc.call(sum)
# end

# doubler = Proc.new {|el| el * 2}

# p add_and_proc(10, 20, doubler)


# def add_and_proc(num1, num2, prc)
#     sum = num1 + num2
#     prc.call(sum)
# end

# negate = Proc.new {|el| el * -1}
# p add_and_proc(10, 20, negate)


# def add_and_proc(num1, num2, &prc)
#     sum = num1 + num2
#     prc.call(sum)
# end

# negate = Proc.new {|el| el * -1}
# p add_and_proc(10, 20, &negate)




def my_map(arr, &prc)
    new_arr = []

    arr.each {|el| new_arr << prc.call(el)}
    
    new_arr
end

p my_map([1,2,3,4,5]) {|el| el * 1000}

