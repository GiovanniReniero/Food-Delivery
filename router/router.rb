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
    puts "3 - List all customers"
    puts "4 - Add a new customer"
    # puts "3 - Delete a meal"
    puts "5 - Exit"

    print "> "
  end

  def route_action(action)
    case action 
      when 1 then @meal_controller.list
      when 2 then @meal_controller.create
        # when 3 then @controller.destroy
      when 3 then @customer_controller.list
      when 4 then @customer_controller.create
      when 5 then stop
    else
      puts "Please press 1, 2, 3, 4 or 5"
    end
  end     

end
  