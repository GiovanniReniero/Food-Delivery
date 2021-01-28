class Employee
  attr_reader :employee_username, :employee_password
  attr_accessor :employee_role, :employee_id

  def initialize(attributes = {})
    @employee_username = attributes[:employee_username]
    @employee_role = attributes[:employee_role] # manager or delivery_guy
    @employee_password = attributes[:employee_password]
    @employee_id = attributes[:employee_id]    
  end

  def manager?
    self.employee_role == 'manager'
  end

  def delivery_guy?
    self.employee_role == 'delivery_guy'
  end

end