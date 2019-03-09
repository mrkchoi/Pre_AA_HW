require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(startup)
        @funding > startup.funding
    end

    def hire(employee_name, title)
        if valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise "Invalid title!"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        salary = @salaries[employee.title]
        if @funding >= salary
            employee.pay(salary)
            @funding -= salary
        else
            raise "Funding insufficient to pay employee!"
        end
    end

    def payday
        @employees.each {|employee| pay_employee(employee)}
    end

    def average_salary
        total_salary = 0
        @employees.each {|employee| total_salary += @salaries[employee.title]}
        total_salary / @employees.length.to_f
    end

    def close
        @employees = []
        @funding = 0
    end
    
    def acquire(startup)
        @funding += startup.funding
        @salaries.merge!(startup.salaries) {|key, old_salary, new_salary| @salaries[key] = old_salary}
        @employees += startup.employees
        startup.close    
    end
end
