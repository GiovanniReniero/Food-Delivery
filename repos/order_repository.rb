require "csv"
require "pry-byebug"
require_relative "../models/order.rb"

require_relative "../models/employee.rb"
require_relative "../models/customer.rb"
require_relative "../models/meal.rb"
require_relative "../repos/employee_repository.rb"
require_relative "../repos/customer_repo.rb"
require_relative "../repos/meals_repository.rb"

class OrderRepository
  attr_accessor :orders
  attr_reader :next_id, :filepath

  def initialize(attributes = {})
    @orders = []
    @filepath = "../data/orders.csv"
    @next_id = 1
    @meal_repository[:meal_repository]
    @customer_repository[:cutomer_repository]
    @employee_repository[:employee_repository]
    parse   
  end
  
  def all
    @orders
  end
  
  def add(order)
    order.order_id = @next_id
    @orders << order
    @next_id += 1
    store
  end
  
private

  def parse
    csv_options = { headers: :first_row, header_converters: :symbol }
    filepath = @filepath
    CSV.foreach(filepath, csv_options) do |row|
      id = row[:id].to_i
      meal = @meal_repository.find_meal(row[:meal_id].to_i)
      customer = @customer_repository.find_customer(row[:customer_id].to_i)
      employee = @employee_repository.find_employee_by_id(row[:employee_id].to_i)
      delivered = row[:delivered] == true # changes value to boolean from string.
      @orders << Order.new(id: id, meal: meal, customer: customer, employee: employee, delivered: delivered)
      @next_id = row[:id]
    end
    @next_id += 1 unless @orders.size == 0 
  end

  def store
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    filepath = @filepath
    CSV.open(filepath, 'wb', csv_options) do |csv|
      csv << ['order_id', 'meal', 'customer', 'employee', 'delivered']
      csv << [order.order_id, order.meal_id, order.customer_id, order.employee_id, order.delivered]
    end
  end

end
