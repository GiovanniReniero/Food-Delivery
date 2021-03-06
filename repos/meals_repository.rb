require_relative '../models/meal.rb'
require 'csv'

class MealsRepository
  attr_accessor :meals, :next_id
  attr_reader :csv_file

  def initialize
    @meals = []
    @csv_filepath = '../data/meals.csv'
    @next_id = 1
    parse unless File.zero?(@csv_filepath)
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

  def find_index(meal)
    @meals.find_index(meal)
  end

  def find_meal(meal_id)
    meal = @meals.select { |meal| meal.meal_id == meal_id }
    meal[0]
  end
  
  def swap(meal_edit, i)
    @meals[i] = meal_edit
    store
  end
  
  def delete(index)
    @meals.delete_at(index)
    store
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
    @next_id += 1 unless @meals.size == 0
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
