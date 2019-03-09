require 'byebug'

class Array
    def uniq_and_reverse
        unique_array = []
        self.each do |el|
            unique_array << el unless unique_array.include?(el)
        end
        unique_array.reverse
    end
end

p [1,2,2,3,4,4,5,5,6].uniq_and_reverse

# Notes

# 'debugger' or 'byebug' - to set a breakpoint where the code should stop
# 'step' - goes deeper into the function on the current line if possible
# 'next' - advanced to the next line
# 'continue' - lets the execution continue until the natural end or a breakpoint
# 'byebug filename.rb' - start the file in debug mode
# 'p' - to print ruby code in the terminal
# 'display' - to automatically have variables printed when code stops
# 'where' - to show the call stack, also can use 'up' and 'down' to nagivate through the call stack hierarchy
# 'b <linenumber>' - to set a breakpoint so the code will always stop