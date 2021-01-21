class Meal
  attr_reader :name, :price
  attr_accessor :meal_id

  def initialize(attributes = {})
    @name = attributes[:name]
    @price = attributes[:price]
    @meal_id = attributes[:meal_id]
  end
end


# pizza = Meal.new( name:'Pizza', price: '£5')
# pasta = Meal.new( name:'Pasta', price: '£15')

# p pizza.meals_id
# p pasta.price

