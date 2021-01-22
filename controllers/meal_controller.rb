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
    index = @meal_view.meal_select
    @meals_repository.delete(index)
    list
  end

  def edit
    list
    index = @meal_view.meal_select
    meal = @meals_repository.edit(index)
    meal_edit = @meal_view.meal_edit(meal)
    @meals_repository.swap(meal_edit)
    list 
  end
  

end
