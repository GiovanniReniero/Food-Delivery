require_relative "../repos/meals_repository.rb"
#require_relative 'controller'
require_relative '../router/router.rb'

meals_repository = MealsRepository.new
# view = View.new
# controller = Controller.new(meals_repository, view)
router = Router.new # (controller)
router.run