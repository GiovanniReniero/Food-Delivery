require 'pry-byebug'

class CustomerController
  attr_reader :customer_view, :customer_repository

  def initialize(attributes = {})
    @customer_view = attributes[:customer_view]
    @customer_repository = attributes[:customer_repository]
  end

  def create
    new_customer = @customer_view.new_customer
    # binding.pry
    @customer_repository.add(new_customer)
  end
  
  def list
    list = @customer_repository.all
    list.size == 0 ? @customer_view.no_customers : @customer_view.all_customers(list)
  end

end 
