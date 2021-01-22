require 'pry-byebug'
require_relative "../repos/meals_repository.rb"

class MealController
  
  def initialize(attributes = {})
    @meal_view = attributes[:meal_view]
    @meals_repository = attributes[:meals_repository]      
  end
  
  def create
    new_meal = @meal_view.new_meal
    # binding.pry
    @meals_repository.add(new_meal)
    list
  end
  
  def list
    list = @meals_repository.all
    @meal_view.all_meals(list)    
  end
  
    


end