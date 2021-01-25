class Employee
  attr_reader :employee_username, :employee_password
  attr_accessor :employee_role, :employee_id

  def initialize(attributes = {})
    @employee_username = attributes[:employee_username]
    @employee_role = attributes[:employee_role]
    @employee_password = attributes[:employee_password]
    @employee_id = attributes[:employee_id]    
  end

end