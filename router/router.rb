require_relative "../repos/meals_repository.rb"
# require "pry-byebug"

class Router
  
  def initialize(attributes = {})
    @meal_controller = attributes[:meal_controller]
    @customer_controller = attributes[:customer_controller]
    @running = true
  end
  
  def run
    puts "Welcome to Food Delivery!"
    puts  "**********--***********"

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  def display_tasks
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
    puts "9 - Exit"

    print "> "
  end

  def route_action(action)
    case action 
      when 1 then @meal_controller.list
      when 2 then @meal_controller.create
      when 3 then @meal_controller.edit
      when 4 then @meal_controller.destroy
      when 5 then @customer_controller.list
      when 6 then @customer_controller.create
      when 7 then @customer_controller.edit
      when 8 then @customer_controller.destroy
      when 9 then stop
    else
      puts "Please select 1 to 9"
    end
  end     
end
  