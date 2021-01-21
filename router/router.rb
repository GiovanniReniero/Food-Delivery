require_relative "../repos/meals_repository.rb"
# require "pry-byebug"

class Router
  
  def initialize
    # @controller = controller
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
    puts "3 - Delete a meal"
    puts "4 - Exit"
    print "> "
  end

  def route_action(action)
    case action 
      when 1 then @controller.all
      when 2 then @controller.add
      when 3 then @controller.destroy
      when 4 then stop
    else
      puts "Please press 1, 2, 3 or 4"
    end
  end     

end
  