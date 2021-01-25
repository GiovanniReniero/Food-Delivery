class Employee
  attr_reader :employee_username, :employee_password, :employee_id
  attr_accessor :employee_role

  def initialize(attibutes = {})
    @employee_username = attributes[:employee_username]
    @employee_role = attributes[:employee_role] # manager or delivery_guy
    @employee_password = attributes[:employee_password]
    @employee_id = attributes[:employee_id]    
  end

end