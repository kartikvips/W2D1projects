require 'byebug'

class Employee
  attr_reader :list, :salary
  def initialize(name, title, salary, bonus)
    @name = name
    @title = title
    @salary = salary
    @bonus = bonus
  end

  def bonus(multiplier)
    @bonus = (@salary) * multiplier
  end

  def list
    []
  end

end

class Manager < Employee

  attr_reader :list, :salary

  def initialize(name, title, salary, bonus, list)
    @list = list
    super(name, title, salary, bonus)
  end

  def sum_of_employee_sals
    # debugger
    return 0 if self.list == []
    sum = 0
    list.each do |emp|
      if emp.is_a?(Manager)
        sum = emp.salary + emp.sum_of_employee_sals
      else
        sum += emp.salary
      end

    end
    sum
  end

  def bonus(multiplier)
    @bonus = sum_of_employee_sals * multiplier
  end


end

if __FILE__ == $PROGRAM_NAME
  shawna = Employee.new("shawna", "TA", 12000, 0)
  david = Employee.new("david", "TA", 10000, 0)
  darren = Manager.new("darren", "manager", 78000, 0, [shawna, david])
  ned = Manager.new("ned", "founder", 1000000, 0, [darren])
  p ned.bonus(5) # => 500_000
  p darren.bonus(4) # => 88_000
  p david.bonus(3) # => 30_000
end
