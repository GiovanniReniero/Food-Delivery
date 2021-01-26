class Order
  attr_accessor :delivered, :order_id, :meal, :customer, :employee

  def initialize(attributes = {})
    @meal = attributes[:meal] 
    @customer = attributes[:customer]
    @employee = attributes[:employee]
    @order_id
    @delivered = false
  end
  
end