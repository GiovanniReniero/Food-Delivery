class MealController
  
  def initialize(meal_view, meals_repository)
    @meal_view = meal_view
    @meals_repository = meals_repository      
  end
  
  def create
    new_meal = @meal_view.new_meal
    @meals_repository.add(new_meal)
    list
  end
  
  def list
    list = @meals_repository.all
    list.all_meals    
  end
  
    


end