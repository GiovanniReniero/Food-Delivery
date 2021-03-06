require "csv"
require_relative "../models/order.rb"

class OrderRepository
  attr_accessor :orders, :next_id
  attr_reader :filepath, :meals_repository, :customer_repository, :employee_repository
  
  def initialize(attributes = {})
    @orders = []
    @filepath = "../data/orders.csv"
    @next_id = 1
    @meals_repository = attributes[:meals_repository]
    @customer_repository = attributes[:customer_repository]
    @employee_repository = attributes[:employee_repository]
    parse unless File.zero?(@filepath)   
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

  def find_undelivered
    jack = @orders.select { |order| order.delivered == false }
  end

  def find_undelivered_by_employee(employee)
    @orders.select { |order| order.employee == employee && order.delivered == false}
  end

  def find_by_order_id(order_id)
    order = @orders.find { |order| order.order_id == order_id }
  end
  
  def delivered(order)
    order.delivered = true
  end

  def swap_order(order_id, order)
    index = @orders.find_index { |order| order.order_id == order_id }
    @orders[index] = order
    store
  end
  
  def delete_orders
    @orders = []
    store
  end

private

  def true?(string)
    string == 'true'
  end

  def parse
    csv_options = { headers: :first_row, header_converters: :symbol }
    filepath = @filepath
    CSV.foreach(filepath, csv_options) do |row|
      order_id = row[:order_id].to_i
      meal = @meals_repository.find_meal(row[:meal].to_i)
      customer = @customer_repository.find_customer(row[:customer].to_i)
      employee = @employee_repository.find_employee_by_id(row[:employee].to_i)
      delivered = true?(row[:delivered]) # changes value to boolean from string.Needs to be investigated
      @orders << Order.new(order_id: order_id, meal: meal, customer: customer, employee: employee, delivered: delivered)
      @next_id = row[:order_id].to_i
    end
    @next_id += 1 unless @orders.size == 0 
  end

  def store
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    filepath = @filepath
    CSV.open(filepath, 'wb', csv_options) do |csv|
      csv << ['order_id', 'meal', 'customer', 'employee', 'delivered']
      @orders.each { |order| csv << ["#{order.order_id}", "#{order.meal.meal_id}", "#{order.customer.customer_id}", "#{order.employee.employee_id}", "#{order.delivered}"] }
    end
  end
end
