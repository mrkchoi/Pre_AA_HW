



# def blocker(a, b, &prc)
#     prc.call(a, b)
# end

# # Examples
# p blocker(4, 5) { |a, b| a * b } # => 20
# p blocker(3, 2) { |a, b| a * b } # => 6
# p blocker("Hello", "World") { |a, b| a.upcase + " " + b.downcase + "!" } # => "HELLO world!"
# p blocker("cellar", "door") { |a, b| a.upcase + " " + b.downcase + "!" } # => "CELLAR door!"



# def at_least?(arr, num, &prc)
#     count = 0
#     arr.each {|el| (count += 1) if prc.call(el)}
#     count >= num
# end







# # Examples
# p at_least?(["a", "B", "C", "D", "E"], 3) { |el| el == el.upcase } # => true
# p at_least?(["a", "B", "C", "d", "E"], 3) { |el| el == el.upcase } # => true
# p at_least?(["a", "B", "C", "d", "e"], 3) { |el| el == el.upcase } # => false
# p at_least?(["a", "B", "C", "d", "e"], 3) { |el| el == el.upcase } # => false
# p at_least?(["a", "B", "C", "d", "e"], 2) { |el| el == el.upcase } # => true
# p at_least?([-3, -11, -5], 1) { |el| el > 0 }                      # => false
# p at_least?([-3, 11, -5], 1) { |el| el > 0 }                       # => true
# p at_least?([3, 11, -5], 1) { |el| el > 0 }                        # => true




# def nth_fibonacci(num)
#     fib_nums = [1, 1]
#     (return fib_nums[num - 1]) if num == 1 || num == 2

#     while fib_nums.length < num
#         current_el = fib_nums[-1] + fib_nums[-2]
#         fib_nums << current_el
#     end

#     fib_nums[-1]
# end




# # Examples
# p nth_fibonacci(1)  # => 1
# p nth_fibonacci(2)  # => 1
# p nth_fibonacci(3)  # => 2
# p nth_fibonacci(4)  # => 3
# p nth_fibonacci(5)  # => 5
# p nth_fibonacci(6)  # => 8
# p nth_fibonacci(7)  # => 13
# p nth_fibonacci(10) # => 55
# p nth_fibonacci(25) # => 75025






# def greatest_common_factor(arr)
#     factors = []
#     start = arr[0]
#     return arr[0] if arr.length == 1

#     i = 1
#     while i < arr.length
#         factors << start.gcd(arr[i])
#         i += 1
#     end

#     factors.sort[0]
# end



# # Examples
# p greatest_common_factor([8, 24, 12])       # => 4 
# p greatest_common_factor([15, 30])          # => 15
# p greatest_common_factor([24, 30, 21])      # => 3
# p greatest_common_factor([24, 30, 21, 7])   # => 1
# p greatest_common_factor([16])              # => 16


# proc = Proc.new {"Hello World!"}
# p proc.call



# class Cat 
#     def initialize(name, color, age)
#         @name = name
#         @color = color
#         @age = age
#     end

#     def name
#         @name
#     end

#     def age
#         @age
#     end

#     def age=(new_age)
#         @age = new_age
#     end

#     def purr
#         if @age > 5
#             p @name.upcase + ' goes purrrrr....'
#         else
#             p '...'
#         end
#     end

#     def meow_at(person)
#         if @age > 5
#             p "#{@name} ROARRRED at #{person}!!!"
#         else
#             p "#{@name} meowed at #{person}."
#         end
#     end


# end

# cat_1 = Cat.new('Garfield', 'orange', 10)
# cat_2 = Cat.new('Sennacy', 'brown', 5)

# # p cat_1.name
# # p cat_1.age

# # p cat_2.name
# # cat_2.age = 100
# # p cat_2.age

# # cat_1.purr
# # cat_2.purr

# # cat_1.age = 12345
# # p cat_1.age
# # # p 'aeiou'.include?('e')


# cat_1.meow_at("Kenneth")
# cat_2.meow_at('Jenny')


# class Car 
#     NUM_WHEELS = 4

#     def self.upgrade_to_flying_cars
#         NUM_WHEELS = 0
#     end
    
#     def initialize(color)
#         @color = color
#     end

#     def color
#         @color
#     end

#     def num_wheels
#         @@num_wheels
#     end
# end

# car_1 = Car.new('black')
# car_2 = Car.new('white')

# p car_1.num_wheels
# p Car.upgrade_to_flying_cars

# p car_1.num_wheels



# class Car
#     NUM_WHEELS = 4

#     # def self.upgrade
#     #     NUM_WHEELS = 0
#     # end
    
#     def initialize(color)
#         @color = color
#     end

#     def color
#         @color
#     end

#     def num_wheels
#         NUM_WHEELS
#     end
# end

# p car_1 = Car.new('black')
# p car_2 = Car.new('white')

# p car_1.num_wheels
# p car_2.num_wheels

# # Car.upgrade

# p car_1.num_wheels
# p car_2.num_wheels

# car_3 = Car.new('silver')
# p car_3.num_wheels



# class Dog
#     def initialize(name, bark)
#         @name = name
#         @bark = bark
#     end

#     def self.growl
#         'Grrrrrrr'
#     end
# end

# dog_1 = Dog.new('Fido', 'aroooooo!!')
# p Dog.growl


# class Dog
#     def initialize(name, bark)
#         @name = name
#         @bark = bark
#     end

#     def self.whos_louder(dog_1, dog_2)
#         if dog_1.bark.length > dog_2.bark.length
#             return dog_1.name
#         elsif dog_1.bark.length < dog_2.bark.length
#             return dog_2.name
#         else
#             return nil
#         end
#     end

#     def name
#         @name
#     end

#     def bark
#         @bark
#     end
# end


# dog_1 = Dog.new('Fido', 'woof!')
# dog_2 = Dog.new('Doge', 'much bork!')

# p Dog.whos_louder(dog_1, dog_2)



class Dog 
    def initialize(name)
        @name = name
    end

    # bark is a class method, as denoted by the 'self.'
    def self.bark
        "WOOF!!!"
    end

    def self.compare_dogs(dog_1, dog_2)
        if dog_1.name.length > dog_2.name.length
            dog_1.name
        else
            dog_2.name
        end
    end

    # The follow methods are instasnce methods
    def yell_name
        @name.upcase + '!'
    end

    def name
        @name
    end

    # Dog::bark is a class method
    # Dog#yell_name is an instance method
end

dog_1 = Dog.new('Fido')
dog_2 = Dog.new('Garfield')

p Dog.compare_dogs(dog_1, dog_2)
