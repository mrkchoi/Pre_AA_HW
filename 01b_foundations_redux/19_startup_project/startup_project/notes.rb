


# class Person

#     attr_reader :first_name, :last_name

#     def initialize(first_name, last_name, age)
#         @first_name = first_name
#         @last_name = last_name
#         @age = age
#     end

#     def ==(other_person)
#         self.last_name == other_person.last_name
#     end
# end




# class Queue
#     def initialize
#         @line = []
#     end

#     def add(el)
#         @line << el
#         nil
#     end

#     def remove
#         @line.shift
#     end

#     def [](position)
#         @line[position]
#     end
# end


# class Queue
#     def initialize
#         @line = []
#     end

#     def add(el)
#         @line << el
#     end

#     def remove
#         @line.shift
#     end

#     def [](position)
#         @line[position]
#     end

#     def []=(position, el)
#         @line[position] = el
#     end
# end



# class Person
#     attr_reader :first_name, :last_name, :age

#     def initialize(first_name, last_name, age)
#         @first_name = first_name
#         @last_name = last_name
#         @age = age
#     end

#     def ==(other_person)
#         self.last_name == other_person.last_name
#     end

#     def >(other_person)
#         self.age > other_person.age
#     end

#     def <(other_person)
#         self.age < other_person.age
#     end
# end



class Queue
    def initialize
        @line = []
    end

    def add(el)
        @line << el
    end

    def remove
        @line.shift
    end

    def [](position)
        @line[position]
    end

    def []=(position, el)
        @line[position] = el
    end
end