require_relative "../repos/meals_repository.rb"
require_relative "../repos/customer_repo.rb"
require_relative "../repos/employee_repository.rb"

require_relative "../views/meal_view.rb"
require_relative "../views/customer_view.rb"
require_relative "../views/session_view.rb"

require_relative "../controllers/meal_controller.rb"
require_relative "../controllers/customer_controller.rb"
require_relative "../controllers/sessions_controller.rb"

require_relative "../router/router.rb"

meals_repository = MealsRepository.new
customer_repository = CustomerRepository.new

meal_view = MealView.new('')
customer_view = CustomerView.new('')

session_view = SessionView.new('')
employee_repository = EmployeeRepository.new

meal_controller = MealController.new(meal_view: meal_view, meals_repository: meals_repository) 

customer_controller = CustomerController.new(customer_view: customer_view, customer_repository: customer_repository) 

sessions_controller = SessionsController.new(session_view: session_view, employee_repository: employee_repository) 


start = Router.new(meal_controller: meal_controller, customer_controller: customer_controller, sessions_controller: sessions_controller)

start.run
