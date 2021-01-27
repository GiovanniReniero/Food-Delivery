class EmployeeView
  attr_reader :employee_view
  
  def initialize(employee_view)
    @employee_view = employee_view
  end

  def all_employees(list)
    list.each { |employee| puts "#{employee.employee_id}.  #{employee.employee_username}....#{employee.employee_role}"}
  end
  
end
