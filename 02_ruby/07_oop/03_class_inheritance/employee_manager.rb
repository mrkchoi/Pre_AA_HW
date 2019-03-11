require "byebug"

class Employee
  attr_reader :name, :title, :salary
  attr_accessor :boss

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

# e = Employee.new('Kenny', "Manager", 100000, 'Mike')



class Manager < Employee
  attr_reader :sub_employees

  def initialize(name, title, salary, boss=nil)
    super(name, title, salary, boss)
    @sub_employees = []
  end

  def add_sub_employee(employee)
    @sub_employees << employee
  end

  def bonus(multiplier)
    sub_em_salary_total = 0

    # debugger
    all_sub_employees.each do |sub_em|
      sub_em_salary_total += sub_em.salary
    end

    sub_em_salary_total * multiplier
  end

  def all_sub_employees
    all_subs = []
    queue = sub_employees

    until queue.empty?
      current_emp = queue.shift
      all_subs << current_emp
      queue += current_emp.sub_employees if current_emp.is_a?(Manager)
    end
    all_subs
  end

end

ned = Manager.new('Ned', "Founder", 1000000)
darren = Manager.new('Darren', "TA Manager", 78000, ned)
shawna = Employee.new('Shawna', "TA", 12000, darren)
david = Employee.new('David', "TA", 10000, darren)

ned.add_sub_employee(darren)
darren.add_sub_employee(shawna)
darren.add_sub_employee(david)

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)