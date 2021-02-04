require_relative "../repos/meals_repository.rb"
require_relative "../models/meal.rb"

class MealView

  def initialize(meal_view)
    @meal_view = meal_view
  end
  
  def new_meal # new_meal = Meal.new(name:'name', price: 'price')
    puts "What's the name of the new meal?"
    print "> "
    name = gets.chomp
    puts "What's the price of #{name} £:...?"
    print "> "
    price = gets.chomp.to_i
    Meal.new(name: name, price: price)
  end
  
  def all_meals(list)
    list.each { |meal| puts "#{meal.meal_id}. #{meal.name}...£#{meal.price}"}
  end

  def meal_select
    puts "Please select which meal to edit or delete..."    
    print "number > "
    id = gets.chomp.to_i
  end
  
  def meal_edit(meal)
    puts "#{meal.meal_id}. #{meal.name}...£#{meal.price}"
    puts "Ok, let's edit the name..."
    print "new name > "
    name = gets.chomp
    puts "...the price too..."
    print "new price £ >"
    price = gets.chomp.to_i
    meal_id = meal.meal_id
    meal_edit = Meal.new(meal_id: meal_id, name:name, price:price)
  end
  
  def select_available
    puts "Select from available list"
    print "number > "
    id = gets.chomp.to_i
  end
end
