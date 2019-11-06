require "byebug" 

class Employee
  def initialize(name, title, salary)
    @name = name 
    @title = title
    @salary = salary
    @boss = nil
  end 

  def bonus(multiplier)
    salary * multiplier
  end 

  protected  
  attr_accessor :salary
  attr_writer :boss 
end 

class Manager < Employee
  def initialize(name, title, salary)
    super 
    @employees = []
  end 

  def add_employee(employee)
    @employees << employee
    employee.boss = self 
  end 

  def bonus(multiplier)
    total_salary = 0 

    #debugger
    reports = employees
    until reports.empty?
      curr_employee = reports.shift 
      total_salary += curr_employee.salary
      reports.concat(curr_employee.employees) if curr_employee.is_a?(Manager)
    end 
    total_salary * multiplier

  end 

  protected 
  attr_reader :employees
end 

shawna = Employee.new("shawna", "TA", 12000)
david = Employee.new("david", "TA", 10000)
darren = Manager.new("darren", "TA Manager", 78000)
darren.add_employee(shawna)
darren.add_employee(david)
ned = Manager.new("ned", "Founder", 1000000)
ned.add_employee(darren)




p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000