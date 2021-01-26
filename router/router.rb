require_relative "../repos/meals_repository.rb"
require_relative "../models/employee.rb"
require_relative "../controllers/sessions_controller.rb"
# require "pry-byebug"

class Router
  
  def initialize(attributes = {})
    @meal_controller = attributes[:meal_controller]
    @customer_controller = attributes[:customer_controller]
    @sessions_controller = attributes[:sessions_controller]
    @employee
    @running = true
  end
  
  def run
    puts "Welcome to Food Delivery!"
    puts  "**********--***********"
    while @running
      loop do
        @employee = @sessions_controller.login
        unless @employee == nil
          if @employee.manager?      
            display_tasks_manager
            action = gets.chomp.to_i
            print `clear`
            route_manager_action(action)
          else
            display_tasks_delivery_guy(@employee)
            action = gets.chomp.to_i
            print `clear`
            route_delivery_guy_action(action)
          end
        end
      end
    end
  end


  def display_tasks_delivery_guy(employee)
    puts ""
    puts "Wecome #{employee.employee_username}!"
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
      when 1 then # @employee_controller something
      when 2 then # @employee_controller something
      when 3 then @employee = nil
      when 4 then exit
    else
      puts "Please select 1 to 9"
    end
  end

  def display_tasks_manager
    puts ""
    puts "Wecome Boss!"
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
    puts "9 - Sign Out"
    puts "0 - Exit"

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
      when 9 then @employee = nil
      when 0 then exit 
    else
      puts "Please select 1 to 9"
    end
  end     

end
