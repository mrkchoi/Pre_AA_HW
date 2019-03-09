
# Monkey patching - adding additional methods to an existing class

# Ruby Types are really classes: Integer, String, Array, Hash, etc...

# class String
#     def upcase?
#         return true if self.upcase == self
#         false
#     end

# end


# # p "hello".upcase? # => false
# # p "HELLO".upcase? # => true


# class Integer
#     def prime?
#         return false if self < 2
#         (2...self).each {|el| return false if self % el == 0}
#         true
#     end
# end

# p 10.prime?



class Array
    def has_zero?
        self.any? {|el| return true if el == 0}
        false
    end
end

p [1,2,3,4,5,'twenty'].has_zero?
p [1,2,3,4,5,0,[0]].has_zero?

