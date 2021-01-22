require_relative "../repos/meals_repository.rb"
# require_relative "../controllers/meal_controller.rb"

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
  

end