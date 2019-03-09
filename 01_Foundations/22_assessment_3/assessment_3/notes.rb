


# # class Restaurant
# #     attr_reader :name, :location, :customers

# #     def initialize(name, location, capacity)
# #         @name = name
# #         @location = location
# #         @capacity = capacity
# #         @customers = []
# #     end

# #     def seat_customer(name)
# #         @customers << name if @customers.length < @capacity
# #     end
# # end

# # restaurant_1 = Restaurant.new("Appetizer Academy", "NY", 3)

# # restaurant_1.seat_customer("Cynthia")
# # p restaurant_1.customers        # => ["Cynthia"]
# # restaurant_1.seat_customer("Oliver")
# # p restaurant_1.customers        # => ["Cynthia", "Oliver"]
# # restaurant_1.seat_customer("Simcha")
# # p restaurant_1.customers        # => ["Cynthia", "Oliver", "Simcha"]
# # restaurant_1.seat_customer("Ryan")
# # p restaurant_1.customers        # => ["Cynthia", "Oliver", "Simcha"]


# # restaurant_2 = Restaurant.new("1x Club", "SF", 1)

# # restaurant_2.seat_customer("Vanessa")
# # p restaurant_2.customers        # => ["Vanessa"]
# # restaurant_2.seat_customer("Eli")
# # p restaurant_2.customers        # => ["Vanessa"]
# # restaurant_2.seat_customer("Candace")
# # p restaurant_2.customers        # => ["Vanessa"]




# # class Integer
# #     def factors
# #         output = []
# #         (1..self).each do |el|
# #             if self % el == 0
# #                 output << el
# #             end
# #         end
# #         output
# #     end
# # end

# # p 6.factors   # => [1, 2, 3, 6]
# # p 15.factors  # => [1, 3, 5, 15]
# # p 17.factors  # => [1, 17]
# # p 24.factors  # => [1, 2, 3, 4, 6, 8, 12, 24]





# def highest_score(students)
#     average_scores = []

#     students.each do |student|
#         average_scores << average_score(student)
#     end

#     highest_idx = average_scores.index(average_scores.max)
#     initials(students[highest_idx])
# end

# def average_score(student)
#     total_scores = student["scores"].sum
#     num_of_scores = student["scores"].length
#     avg_score = total_scores / num_of_scores.to_f
# end

# def initials(student)
#     initials_arr = student["name"].split.map {|word| word[0]}
#     initials_arr.join('')
# end


# student = {"name"=>"Alvin Zablan", "scores"=>[-42, 20, 50]}


# students_1 = [
#     {"name"=>"Alvin Zablan", "scores"=>[-42, 20, 50]},
#     {"name"=>"Eliot Bradshaw", "scores"=>[57, 100, 80]},
#     {"name"=>"Tommy Duek", "scores"=>[90, 100]},
#     {"name"=>"Fred Sladkey", "scores"=>[94, 92]}
# ]
# p highest_score(students_1)     # => "TD"

# students_2 = [
#     {"name"=>"Rose Koron", "scores"=>[97, 90]},
#     {"name"=>"Jeff Fiddler", "scores"=>[100, 90, 80]},
#     {"name"=>"Dave Fort", "scores"=>[85, 96]},
#     {"name"=>"Mary La Grange", "scores"=>[100]},
#     {"name"=>"Candace Hsu", "scores"=>[89, 94]}
# ]
# p highest_score(students_2)     # => "MLG"



# 1-2-9-7-8
# 3-4
# 0-5-6




# def po2(num)
#     num & (num - 1) == 0
# end




def total_points(games)
    games.sum {|score| [1, 3, 0][score[0] <=> score[2]]}
end


arr = ['3:1', '0:0', '1:3', '2:1']

['aabb', 'baba', 'bbaa']