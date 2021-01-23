class Meal
  attr_reader :name, :price
  attr_accessor :meal_id

  def initialize(attributes = {})
    @name = attributes[:name]
    @price = attributes[:price]
    @meal_id = attributes[:meal_id]
  end
end
