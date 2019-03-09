
# def test1
#     [1,2,3].map do |num|
#         return num + 1
#     end

#     puts "Never called!"
# end

# def test2
#     [1,2,3].map do |num|
#         num + 1
#     end

#     # puts "All finished!"
# end

# test1
# print test2
# puts



# mapped_arr = ['a','b','c'].map do |el|
#     el.upcase
# end


# print mapped_arr


# maybe(true) {puts 'Hello!'}
# maybe(false) {puts 'Goodbye!'}




# arr = [1,2,3,4]

# arr.each { |el| puts el }


# yield expects a block as an argument, and defers logic to the passed block
# block_given? is a method that returns true if a block is passed in to a method, and false otherwise

# def run_block
#     yield if block_given?
# end

# run_block


# class Array
#     def random_each
#         shuffle.each do |el|
#             yield el
#         end
#     end
# end

# [1,2,3,4,5].random_each do |el|
#     puts el
# end




# class Array
#     def random_each(&b)
#         p b
#         shuffle.each do |el|
#             b.call el
#         end
#     end
# end

# [1,2,3,4,4].random_each do |el|
#     puts el
# end

# def run_two_procs(a,b)
#     a.call
#     b.call
# end

# proc1 = Proc.new do 
#     puts 'This is proc1'
# end

# proc2 = Proc.new do 
#     puts 'This is proc2'
# end

# run_two_procs proc1, proc2



# def run_block
#     p = Proc.new
#     p.call
# end

# run_block 
# # do
# #     puts "Hello World!"
# # end



# my_proc = Proc.new do |el|
#     puts "This is my proc and #{el} was passed to me"
# end

# my_proc.call(10)
# my_proc.(20)
# my_proc[30]
# my_proc === 40



# several = Proc.new {|number| number > 3 && number < 8}
# many    = Proc.new {|number| number > 3 && number < 8}
# few     = Proc.new {|number| number == 3}
# couple  = Proc.new {|number| number == 2}
# none    = Proc.new {|number| number == 0}

# 0.upto(10) do |number|
#     print "#{number} items is "

#     case number
#     when several
#         puts "several"    
#     when many
#         puts "many"
#     when few
#         puts "a few"
#     when couple
#         puts "a couple"
#     when none
#         puts "none at all"
#     else
#         puts "awesome"
#     end
# end



# hello = lambda do |a,b,c|
#     puts "This is proc1"
# end

# hello.call



# def run_a_proc(p)
#     puts "Starting to run a proc"
#     p.call
#     puts "Finished running our proc\n\n"
# end

# def my_program
#     # run_a_proc proc { puts "I'm a proc"; return }
#     run_a_proc lambda { puts "I'm a lambda"; return }
# end

# my_program



# def run_proc(p)
#     p.call
# end

# name = 'Kenny'
# my_proc = proc { puts name }

# run_proc my_proc


# def multiple_generator(m)
#     lambda do |n|
#         n * m
#     end
# end

# doubler = multiple_generator(2)
# tripler = multiple_generator(3)

# puts doubler[5]
# puts tripler[10]



# def run_proc(p)
#     p.call
# end

# name = 'Kenny'
# print_a_name = proc {puts name}
# name = 'John'

# run_proc print_a_name


# def do_something(&p)
#     p.call
# end

# do_something {puts "Our block is preemptively wrapped by a Proc object by including the ampersand!"}


# def i_want_a_block(&prc)
#     prc.call
# end

# my_proc = Proc.new { puts "Wow! What a cool Proc!" }

# i_want_a_block(my_proc)


# def all_even?(arr)
#     arr.each {|el| return false if el.odd?}
#     true
# end

# puts all_even?([2,4,6,8,10])


# def all_even?(arr)
#     arr.all? {|el| el.even?}
# end


# puts all_even?([2,4,6,8,11])


# def any_even?(arr)
#     arr.any? {|el| el.even?}
# end

# puts any_even?([1,3,5,7,9])

# simpleton = [1,2,3]
# print simpleton.map {|el| el * 2}
# puts
# print simpleton
# # puts


# simpleton = [1,2,3]
# print simpleton.map! {|el| el * 2}
# puts
# print simpleton
# puts



# count

# print [1,2,3,4,5].count # => 5
# puts
# print [1,2,3,4,5].count(2) # => 1
# puts
# print [1,2,3,4,5].count {|el| el.even?} # => 2
# puts



# # select & reject
# arr = [1,2,3,4,5,6,7,8,9,10]

# print arr.reject! {|num| num >= 5} 
# puts
# print arr
# puts


# test_str = 'The sort_by method sorts its receive by the return values of its
# elements when they are passed to the given block, and it returns an array in 
# that order.'

# def sort_by_length(str)
#     str_arr = str.split(' ')
#     str_arr.sort_by {|word| word.length}
# end

# print sort_by_length(test_str)
# puts


# print [1,2,3].reduce(:+)
# puts

# print [1,4,5].reduce(:*)
# puts


# print [3.0,2.0,1.0].reduce(:/)
# puts

# print [1.0,2.0,3.0].reduce(:/)




# print [1,2,3].reduce(10, :+)
# puts

# print [1,2,3.0].reduce(10, :/)
# puts


# def longest_word(str)
#     str_arr = str.split(' ')
#     longest_word = ''

#     str_arr.each do |word|
#         if word.length > longest_word.length
#            longest_word = word 
#         end
#     end
#     longest_word
# end

# print longest_word('This is the longest word in our fantastic string!')
# puts



# def longest_word(str)
#     str.split.reduce do |longest, word|
#         if word.length > longest.length 
#             word
#         else
#             longest
#         end
#     end
# end


# print longest_word('This is the longest word in our fantastic string!')
# puts






# def e_words(str)
#     str.split.reduce(0) do |count, el|
#         if el[-1] == 'e'
#             count + 1
#         else
#             count
#         end
#     end
# end


# print e_words('This time I will be more cautious')
# puts






# def boolean_to_binary(arr)
#     arr.reduce('') do |binary, el|
#         if el
#             binary + '1'
#         else
#             binary + '0'
#         end
#     end
# end

# print boolean_to_binary([true, false, false, true, true, true, false, false])
# puts



# def factors(num)
#     (1..num).reduce([]) do |factors, el|
#         if num % el == 0
#             factors << el
#         else
#             factors
#         end
#     end
# end


# print factors(100)
# puts


