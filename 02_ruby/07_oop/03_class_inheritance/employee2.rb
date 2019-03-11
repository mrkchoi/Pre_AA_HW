require 'byebug'

class Employee
  attr_accessor :boss
  attr_reader :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end

end

class Manager < Employee
  attr_reader :employees, :salary

  def initialize(name, title, salary, boss=nil)
    super(name, title, salary, boss)
    @employees = []
  end

  def add_sub_employee(employee)
    @employees << employee
  end

  def bonus(multiplier)
    total_sub_employee_salary = 0

    # debugger
    all_sub_employees.each do |sub_employee|
      total_sub_employee_salary += sub_employee.salary
    end

    total_sub_employee_salary * multiplier
  end

  def all_sub_employees
    # debugger
    all_sub_em = []
    queue = @employees

    until queue.empty?
      current_emp = queue.shift
      all_sub_em << current_emp
      queue += (current_emp.employees) if current_emp.is_a?(Manager)
    end

    all_sub_em
  end
end

ned = Manager.new("Ned", "Founder", 1000000)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

ned.add_sub_employee(darren)
darren.add_sub_employee(shawna)
darren.add_sub_employee(david)

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)