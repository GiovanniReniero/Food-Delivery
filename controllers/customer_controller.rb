require 'pry-byebug'

class CustomerController
  attr_reader :customer_view, :customer_repository

  def initialize(attributes = {})
    @customer_view = attributes[:customer_view]
    @customer_repository = attributes[:customer_repository]
  end

  def create
    new_customer = @customer_view.new_customer
    @customer_repository.add(new_customer)
  end
  
  def list
    list = @customer_repository.all
    list.size == 0 ? @customer_view.no_customers : @customer_view.all_customers(list)
  end

  def destroy
    list
    id = @customer_view.customer_select
    customer = @customer_repository.find_customer(id)
    index = @customer_repository.find_index(customer)
    @customer_repository.delete(index)
    list
  end

  def edit
    list
    id = @customer_view.customer_select
    customer = @customer_repository.find_customer(id)
    index = @customer_repository.find_index(customer)
    customer_edit = @customer_view.customer_edit(customer)
    @customer_repository.swap(customer_edit, index)
    list
 end
end 
