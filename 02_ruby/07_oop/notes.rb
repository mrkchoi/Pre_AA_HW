
# class User
#   attr_reader :first_name, :last_name

#   def initialize(first_name, last_name)
#     @first_name, @last_name = first_name, last_name
#   end

#   def full_name
#     "#{@first_name} #{@last_name}"
#   end

#   def upvote_article(article)
#     article.upvotes += 1
#   end
# end


# class SuperUser < User
#   attr_reader :super_powers

#   def initialize(first_name, last_name, super_powers)
#     super(first_name, last_name)
#     @super_powers = super_powers
#   end

#   def upvote_article(article)
#     article.upvote += 3
#   end

#   def delete_user(user)
#     return unless super_powers.include?(:user_deletion)
#     puts "Goodbye, #{user.full_name}"
#   end
# end



# class Animal
#   def make_n_noises(n = 2)
#     n.times {print "Growl "}
#   end
# end

# class Liger < Animal
#   def make_n_noises(num = 4)
#     num.times {print "Roar "}
#   end
# end




# class Animal
#   attr_reader :species

#   def initialize(species)
#     @species = species
#   end
# end

# class Human < Animal
#   attr_reader :name

#   def initialize(name)
#     super("Homo Sapien")
#     @name = name
#   end
# end



# def sqrt(num)
#   raise ArgumentError.new("Cannot take square root of negative number") unless num >= 0

#   (1..num).each {|n| return n if n * n == num}
# end

# def main
#   while true
#     puts "Please enter a number:\n> "
#     input = gets.chomp.to_i

#     begin
#       sqrt(input)
#     rescue ArgumentError => e
#       puts "Cannot take the square root of a negative number"
#       puts "Error was: #{e.message}"
#     ensure
#       puts "Must print this statement 'ensure' no matter what!"
#     end
#   end
# end
















# def prompt_name
#   print "Please enter your first and last name:\n> "
#   name = gets.chomp.split

#   if name.length != 2
#     raise "Uh-oh, parsing not correct!"
#   end
#   name
# end

# def echo_name
#   begin
#     f_name, l_name = prompt_name
#     print "Hello, #{f_name} #{l_name}"
#   rescue
#     print "Please use only two names."
#     retry
#   end
# end



# def slope(pos1, pos2)
#   (pos2[1] - pos1[1])/(pos2[0] - pos1[0])
# rescue ZeroDivisionError => e
#   print "Error: #{e.message}"  
# end


def prompt_name
  print "Please enter your first and last name:\n> "
  name = gets.chomp.split

  if name.length != 2
    raise "Uh-oh, parsing not correct!"
  end
  name
end

def echo_name
  fname, lname = prompt_name

  print "Hello, #{fname} #{lname}"

rescue
  puts "Please enter two names"
  retry
end