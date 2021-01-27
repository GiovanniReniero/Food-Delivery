class EmployeeController
  attr_reader :employee_view, :employee_repository 
  
  def initialize(attributes ={} )
    @employee_view = attributes[:employee_view]
    @employee_repository = attributes[:employee_repository]
  end

  def list
    list = @employee_repository.all
    @employee_view.all_employees(list)
  end
  
  def list_delivery_guys
    list = @employee_repository.all_delivery_guys
    @employee_view.all_employees(list)
  end

end