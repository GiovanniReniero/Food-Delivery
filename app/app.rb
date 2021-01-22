require_relative "../repos/meals_repository.rb"
require_relative "../views/meal_view.rb"
require_relative "../controllers/meal_controller.rb"
require_relative "../router/router.rb"

meals_repository = MealsRepository.new
meal_view = MealView.new('')
meal_controller = MealController.new(meal_view: meal_view, meals_repository: meals_repository) 
start = Router.new(meal_controller)

start.run