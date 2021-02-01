require_relative "../repos/meals_repository.rb"
require_relative "../models/employee.rb"
require_relative "../controllers/sessions_controller.rb"
require_relative "../controllers/order_controller.rb"
require "pry-byebug"

class Router
  
  def initialize(attributes = {})
    @meal_controller = attributes[:meal_controller]
    @customer_controller = attributes[:customer_controller]
    @sessions_controller = attributes[:sessions_controller]
    @order_controller = attributes[:order_controller]
    @employee
    @running = true
  end
  
  def run
    puts "Welcome to Food Delivery!"
    puts  "**********--***********"
    while @running
      @employee = @sessions_controller.login
      unless @employee == nil
        loop do
          if @employee == nil
            break 
          elsif @employee.manager?      
            display_tasks_manager
            action = gets.chomp.to_i
            print `clear`
            route_manager_action(action)
          elsif @employee.delivery_guy?
            display_tasks_delivery_guy
            action = gets.chomp.to_i
            print `clear`
            route_delivery_guy_action(action)
          end
        end
      end
    end
  end


  def display_tasks_delivery_guy
    puts ""
    puts "Welcome #{@employee.employee_username}!"
    puts ""
    puts "What do you want to do next?"
    puts "1 - List my Orders"
    puts "2 - Mark as delivered"
    puts "3 - Sign Out"
    puts "4 - Exit"
    
    print "> "
  end
      
  def route_delivery_guy_action(action)
    case action
      when 1 then @order_controller.delivery_guy_undelivered(@employee)
      when 2 then @order_controller.mark_as_delivered(@employee)
      when 3 then @employee = nil
      when 4 then exit
    else
      puts "Please select 1 to 9"
    end
  end

  def display_tasks_manager
    puts ""
    puts "Welcome Boss!"
    puts ""
    puts "What do you want to do next?"
      puts "1 - List all meals"
      puts "2 - Add a new meal"
      puts "3 - Edit a meal"
      puts "4 - Delete a meal"
      puts "5 - List all customers"
      puts "6 - Add a new customer"
      puts "7 - Edit a customer's details"
      puts "8 - Delete a customer"
      puts "9 - List all orders"
      puts "10 - List undelivered orders"
      puts "11 - Add a new order"
      puts "12 - Delete all orders"
      puts "111 - Sign Out"
      puts "100- Exit"
      
    print "> "
  end

  def route_manager_action(action)
    case action 
      when 1 then @meal_controller.list
      when 2 then @meal_controller.create
      when 3 then @meal_controller.edit
      when 4 then @meal_controller.destroy
      when 5 then @customer_controller.list
      when 6 then @customer_controller.create
      when 7 then @customer_controller.edit
      when 8 then @customer_controller.destroy
      when 9 then @order_controller.list
      when 10 then @order_controller.list_undelivered
      when 11 then @order_controller.create
      when 12 then @order_controller.delete_orders
      when 111 then @employee = nil
      when 100 then exit 
    else
      puts "Please select 1 to 9"
    end
  end     

end
