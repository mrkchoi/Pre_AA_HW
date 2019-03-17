require 'byebug'

# Big O-ctopus and Biggest Fish
# A Very Hungry Octopus wants to eat the longest fish in an array of fish.

# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"


arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']



# Sluggish Octopus
# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths
def sluggish_octopus(arr)
  greatest = nil

  arr.each do |fish1|
    arr.each do |fish2|
      if fish1.length > fish2.length
        greatest = fish1
      end
    end
  end

  greatest
end

# p sluggish_octopus(arr)





# Dominant Octopus
# Find the longest fish in O(n log n) time. Hint: You saw a sorting algorithm that runs in O(n log n) in the Sorting Complexity Demo. Accessing this on GitHub? Use this link. Remember that Big O is classified by the dominant term.

def dominant_octopus(arr)
  ms(arr).last
end

# => [2, 3, 1, 4]
def ms(arr)
  # debugger
  return arr if arr.length <= 1

  mid = arr.length / 2
  left = arr[0...mid] # => [2, 3]
  right = arr[mid..-1] # => [1, 4]

  merge(ms(left), ms(right))
end

def merge(left, right)
  merged_output = []

  until left.empty? || right.empty?
    if left.first.length < right.first.length
      merged_output << left.shift
    else
      merged_output << right.shift
    end  
  end

  merged_output.concat(left).concat(right)
end

# p dominant_octopus(arr)




arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# Clever Octopus
# Find the longest fish in O(n) time. The octopus can hold on to the longest fish that you have found so far while stepping through the array only once.



def clever_octopus(arr)
  longest = arr[0]
  arr.each {|item| longest = item if item.length > longest.length}
  longest
end

# p clever_octopus(arr)







# Full of fish, the Octopus attempts Dance Dance Revolution. The game has tiles in the following directions:

# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# To play the game, the octopus must step on a tile with her corresponding tentacle. We can assume that the octopus's eight tentacles are numbered and correspond to the tile direction indices.

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]




# Slow Dance
# Given a tile direction, iterate through a tiles array to return the tentacle number (tile index) the octopus must move. This should take O(n) time.

# slow_dance("up", tiles_array)
# > 0

# slow_dance("right-down", tiles_array)
# > 3


def slow_dance(dir, arr)
  arr.each_with_index {|move, i| return i if move == dir}
end

# p slow_dance('up', tiles_array) # => 0
# p slow_dance('right-down', tiles_array) # => 3



# Constant Dance!
# Now that the octopus is warmed up, let's help her dance faster. Use a different data structure and write a new function so that you can access the tentacle number in O(1) time.

def fast_dance(dir, hash)
  hash[dir]
end

def new_ds(arr)
  hash = Hash.new
  arr.each_with_index {|move, i| hash[move] = i}
  hash
end

moves_hash = new_ds(tiles_array)


# p fast_dance("up", moves_hash) # > 0
# p fast_dance("right-down", moves_hash) # > 3