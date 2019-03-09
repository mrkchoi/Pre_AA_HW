# class Klass
#     attr_accessor :str
# end

# module Foo
#     def foo; 'foo'; end
# end

# s1 = Klass.new
# s1.extend(Foo)
# s1.foo

require 'byebug'

class Array
  def bubble_sort!(&prc) # => [5,4,3,6,1]
    debugger
    sorted = false
    if block_given?
      until sorted
        sorted = true
        i = 0
        while i < self.length - 1
          if prc.call(self[i], self[i + 1]) == 1
            self[i], self[i + 1] = self[i + 1], self[i]
            sorted = false
          end
          i += 1
        end
      end
    else
      until sorted
        sorted = true

        i = 0
        while i < self.length - 1
          if self[i] > self[i + 1]
            self[i], self[i + 1] = self[i + 1], self[i]
            sorted = false
          end
          
          i += 1
        end
      end
    end

    self
  end

  def bubble_sort(&prc)
    copy = self.dup
    copy.bubble_sort!(&prc)
  end
end


p [9,7,5,6,7,4,3,2,9,1,0].bubble_sort! {|n1, n2| n2 <=> n1}