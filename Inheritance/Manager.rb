require_relative "Employee"

class Manager < Employee

  attr_reader :employees

  def initialize(name, title, salary, boss)
    super
    @employees = []
  end

  def add_employees(employee)
    @employees << employee
  end

  def bonus(mult)
    bonus_salary * mult
  end

  def bonus_salary 
    total = salary
    self.employees.each do |worker|
      if worker.is_a?(Manager)
        total += worker.bonus_salary + worker.salary
      else
        total += worker.salary
      end
    end
    total
  end

end

if __FILE__ == $PROGRAM_NAME 
  kate = Employee.new("Kate", "TA", 5000, "Joe")
  david = Employee.new("David", "TA", 6000, "Joe")
  manager = Manager.new("Joe", "Manager", 15000, "Kyle")
  puts kate.bonus(5)
  
  manager.add_employees(kate)
  manager.add_employees(david)
  puts manager.bonus(5)
end
