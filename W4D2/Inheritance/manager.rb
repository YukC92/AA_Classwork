require_relative 'employee'

class Manager < Employee

    attr_accessor :employees
    
    def initialize(name, title, salary, boss=nil)
        @employees = []
        super
    end

    def add_employee(employee)
        employees << employee
    end

    def bonus(multiplier)
        sum = @employees.inject(0) { |accm, employee| accm + employee.salary }
        sum * multiplier
    end

end

ned = Manager.new('Ned', 'Founder', 1000000)
darren = Manager.new('Darren', 'TA Manger', 78000, ned)
shawna = Employee.new('Shawna', 'TA', 12000, darren)
david = Employee.new('David', 'TA', 10000, darren)
darren.add_employee(david)
darren.add_employee(shawna)
ned.add_employee(darren)
ned.employees += darren.employees

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000