class Bootcamp
    # part_1
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new {|hash, k| hash[k] = []}
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def student_capacity
        @student_capacity
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def name
        @name
    end

    def hire(teacher)
        @teachers << teacher
    end

    def enroll(student)
        if @students.length < @student_capacity
            @students << student
            return true
        end
        return false
    end

    def enrolled?(student)
        @students.include?(student)
    end

    # part_2
    def student_to_teacher_ratio
        @students.length / @teachers.length
    end

    def add_grade(student, grade)
        if @students.include?(student)
            @grades[student] << grade
            return true
        end
        return false
    end

    def num_grades(student)
        @grades[student].length
    end

    def average_grade(student)
        if self.enrolled?(student) && self.num_grades(student) > 0
            return @grades[student].sum / @grades[student].length
        end
        return nil
    end
end
