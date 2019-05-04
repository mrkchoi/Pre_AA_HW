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
    if @salaries[title]
      return true
    else
      return false
    end
  end

  def >(other_startup)
    if self.funding > other_startup.funding
      return true
    else
      return false
    end
  end

  def hire(name, title)
    if self.valid_title?(title)
      new_hire = Employee.new(name, title)
      @employees << new_hire
    else
      raise 'not a valid title'
    end
  end

  def size
    @employees.count
  end

  def pay_employee(employee)
    salary = @salaries[employee.title]
    if @funding >= salary
      employee.pay(salary)
      @funding -= salary
    else
      raise 'not enough funding'
    end
  end

  def payday
    @employees.each do |person|
      pay_employee(person)
    end
  end

  def average_salary
    salaries = []
    @employees.each do |person|
      salaries << @salaries[person.title]
    end
    salaries.sum / salaries.count.to_f
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(other_startup)
    @funding += other_startup.funding
    other_startup.salaries.each do |k,v|
      if @salaries[k]
        next
      else
        @salaries[k] = v
      end
    end
    @employees = [*@employees, *other_startup.employees]
    other_startup.close()

    
  end
end
