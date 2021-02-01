class Order
  attr_accessor :delivered, :order_id, :meal, :customer, :employee

  def initialize(attributes = {})
    @meal = attributes[:meal] 
    @customer = attributes[:customer]
    @employee = attributes[:employee]
    @order_id = attributes[:order_id]
    @delivered = attributes[:delivered] || false
  end
  
end