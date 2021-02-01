require_relative '../models/order.rb'
require 'pry-byebug'

class OrderController
  attr_reader :order_repository, :order_view, :meal_controller, :customer_controller, :employee_controller
  
  def initialize(attributes = {})
    @order_repository = attributes[:order_repository]
    @meals_repository = attributes[:meals_repository]
    @customer_repository = attributes[:customer_repository]
    @employee_repository = attributes[:employee_repository]
    @order_view = attributes[:order_view]
    @session_view = attributes[:session_view]
    @meal_controller = attributes[:meal_controller]
    @customer_controller = attributes[:customer_controller]
    @employee_controller = attributes[:employee_controller]
  end
  
  def create
    @meal_controller.list
    meal_id = @order_view.new_order('meal')
    meal = @meals_repository.find_meal(meal_id)

    @customer_controller.list
    customer_id = @order_view.new_order('customer')
    customer = @customer_repository.find_customer(customer_id)

    @employee_controller.list_delivery_guys
    employee_id = @order_view.new_order('delivery_guy')
    employee = @employee_repository.find_employee_by_id(employee_id)

    order = Order.new( meal: meal, customer: customer, employee: employee )
    @order_repository.add(order)
  end
  
  def list
    list = @order_repository.all
    @order_view.all_orders(list)
  end
  
  def list_undelivered
    list = @order_repository.find_undelivered
    @order_view.all_orders(list)
  end
  
  def delivery_guy_undelivered(employee)
    list = @order_repository.find_undelivered_by_employee(employee)
    @order_view.delivery_guy_orders(list)
  end

  def mark_as_delivered(employee)
    delivery_guy_undelivered(employee) 
    order_id = @session_view.ask_for('delivered').to_i
    order = @order_repository.find_by_order_id(order_id)
    @order_repository.delivered(order)
    # binding.pry
    @order_repository.swap_order(order_id, order)
    delivery_guy_undelivered(employee) 
    
  end

  def delete_orders
    answer = @order_view.confirm
    if answer == 'y'
      @order_repository.delete_orders
    else
      list
    end
  end
  
end
