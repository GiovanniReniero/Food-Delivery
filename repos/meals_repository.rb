require_relative '../models/meal.rb'
require 'pry-byebug'
require 'csv'

class MealsRepository
  attr_accessor :meals
  attr_reader :csv_file, :next_id

  def initialize
    @meals = []
    @csv_filepath = '../data/meals.csv'
    @next_id = 1
    parse
  end
  
  def add(meal)
    meal.meal_id = @next_id
    @meals << meal
    @next_id += 1
    store
  end

  def all
    @meals    
  end
  
  def find(index)
    i = index - 1
    @meals.slice(i)
  end
  
private

  def parse
    csv_options = { headers: :first_row, header_converters: :symbol }
    filepath  = @csv_filepath
    CSV.foreach(filepath, csv_options) do |row|
      row[:meal_id] = row[:meal_id].to_i
      @meals << Meal.new(row)
      @next_id = row[:meal_id]
    end
    @next_id += 1
  end
  
  def store
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    filepath = @csv_filepath
    CSV.open(filepath, 'wb', csv_options) do |csv|
      csv << ['meal_id', 'name', 'price']
      @meals.each { |meal| csv << ["#{meal.meal_id}","#{meal.name}", "#{meal.price}"] }
    end
  end
end

# repo = MealsRepository.new
# p repo
