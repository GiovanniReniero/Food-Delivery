require_relative "../repos/meals_repository.rb"

class MealController
  
  def initialize(attributes = {})
    @meal_view = attributes[:meal_view]
    @meals_repository = attributes[:meals_repository]
  end
  
  def create
    new_meal = @meal_view.new_meal
    @meals_repository.add(new_meal)
    list
  end
  
  def list
    list = @meals_repository.all
    @meal_view.all_meals(list)
  end

  def destroy
    list
    # available = @meals_repository.all_id 
    id = @meal_view.meal_select
    # @meal_view.select_available
    meal = @meals_repository.find_meal(id)
    index = @meals_repository.find_index(meal)
    @meals_repository.delete(index)
    list
  end

  def edit
    list
    id = @meal_view.meal_select
    meal = @meals_repository.find_meal(id)
    index = @meals_repository.find_index(meal)
    meal_edit = @meal_view.meal_edit(meal)
    @meals_repository.swap(meal_edit, index)
    list 
  end
  

end
