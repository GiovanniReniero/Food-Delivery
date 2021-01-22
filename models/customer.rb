class Customer
   attr_accessor :customer_id
   attr_reader :customer_name, :customer_address

  def initialize(attributes = {})
    @customer_name = attributes[:customer_name]
    @customer_address = attributes[:customer_address]
    @customer_id = attributes[:customer_id]
  end
  




end