



# num = 5

# begin
#     puts "dividing 10 by #{num}"
#     ans = 10 / num
#     puts "the answer is #{ans}"
# rescue
#     puts "There was an an error with the division!"
# end

# puts "----------------"
# puts "finished!"


def format_name(first, last)
    if !(first.instance_of?(String) && last.instance_of?(String))
        raise "arguments must be strings"
    end
    
    first.capitalize + " " + last.capitalize
end

# p 'hello'.instance_of?(String)
# p 42.instance_of?(String)

first_name = nil
last_name = "Hopper"

begin
    p format_name(first_name, last_name)
    p "format_name ran successfully!"
rescue
    p 'There was an exception!'
end