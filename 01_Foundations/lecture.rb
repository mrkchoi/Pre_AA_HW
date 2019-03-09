# puts 'hello!'

# puts 1 + 1 


# Implicit Return

# def get_avg(num1, num2)
#     (num1 + num2) / 2
# end

# print get_avg(1,2.0)
# puts

# # Omitting parentheses

# def say_hi
#     puts 'hello' if true
# end
# say_hi


# Use built-in methods

# num = 6

# # print num % 2 == 0
# # puts


# print num.even?
# puts


# people = ['Joey', 'Bex', 'Andrew']

# # print people[people.length - 1]
# # puts

# # print people[-1]
# # puts

# # print people.last


# def say_hi(num)    
#     i = 0
#     while i < num
#         print 'hi!'

#         i += 1
#     end
# end


# def say_hi(num)
#     num.times {print 'hi!'}
# end

# say_hi(3) 



# def all_even?(nums)
#     nums.each do |num|
#         return false if num % 2 != 0
#     end
#     true
# end

# def all_even?(nums)
#     nums.all? {|num| num.even?}
# end


# print all_even?([2,4,6,8,10])





# all?

# print [1,[2],3,[4,5]].flatten
# puts

# print [['a',['b', ['b1','b2']]],['c','d']].flatten(1)
# puts


# print [3,4,5,7].count {|num| num.odd?}
# puts



# Symbols

# str = 'hello'
# sym = :hello

# str[0] = 'x'
# # sym[0] = 'x'

# puts str
# puts sym


# print'hello'.object_id
# puts
# print'hello'.object_id
# puts
# print'hello'.object_id
# puts
# print'hello'.object_id
# puts


# print :hello.object_id
# puts
# print :hello.object_id
# puts
# print :hello.object_id
# puts
# print :hello.object_id
# puts


# my_bootcamp = {
#     :name => 'App Academy',
#     :location => 'San Francisco',
#     :cohort => 'May 13th'
# }

# print my_bootcamp[:location]
# puts

# my_bootcamp = {
#     name: 'App Academy',
#     location: 'San Francisco',
#     cohort: 'May 13th',
#     ranking: '#1 in USA'
# }

# print my_bootcamp
# puts
# print my_bootcamp[:name]
# puts
# print my_bootcamp[:location]
# puts
# print my_bootcamp[:cohort]
# puts
# print my_bootcamp[:ranking]
# puts












# sym = :hello
# str = 'hello'

# Symbols are immutable - cannot change
# Strings are mutable - can change

# sym[1] = 'x'

# p sym


# p :hello.object_id
# p :hello.object_id
# p :hello.object_id
# p :hello.object_id



# bootcamp = {
#     :name => 'App Academy',
#     :color => 'red'
# }

# bootcamp2 = {
#     name: 'App Academy',
#     color: 'red',
#     location: 'San Francisco'
# }

# p bootcamp2


# def repeat(msg, num = 1)
#     msg * num    
# end

# p repeat('hi', 100000)




# def greet(p1, p2=nil)
#     if p2.nil?
#         p "Hello #{p1}!"
#     else
#         p "Hello #{p1} & #{p2}!"
#     end
# end

# greet('Kenny', 'Anna')



# def method(hash)
#     p hash
# end

# method(name: 'App Academy', location: 'SF')



# def modify_str(str, options={'upper'=> false, 'repeats'=> 1})
#     str.upcase! if options['upper']
#     p str * options['repeats']
# end

# modify_str('This is a String!')

# def repeat(str, n=1)
#     p str * n
# end

# repeat('hi')



# def print_h(name, hash)
#     p name
#     p hash
# end

# print_h('Kenny', 
#     :name => 'App Academy',
#     :location => 'SF'
# )



# def method(a1, a2, *other_args)
#     p a1
#     p a2
#     p other_args
# end

# method("a","b")
# # method("a","b","c","d","e")


# def greet(first_name, last_name)
#     p "Hi #{first_name}! Your last name is #{last_name}"
# end

# names = ['Grace','Hopper']
# greet(*names)


# arr_1 = ["a", "b"]
# arr_2 = ['d','e']
# arr_3 = [*arr_1, 'c', *arr_2]
# p arr_3




# hash_1 = {
#     a: 1,
#     b: 2
# }

# hash_2 = {
#     **hash_1,
#     c: 3
# }

# p hash_2




# Inject

# arr_min = [1,2,3,4,5].inject(100) do |acc, el|
#     acc * el
# end

# p arr_min



arr = [1,2,3,4,5,6,7,8,9,10]

even_sum = arr.inject(0) do |acc, el|
    if el.even?
        acc + el
    else
        acc
    end
end

p even_sum