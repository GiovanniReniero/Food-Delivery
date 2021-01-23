require_relative '../models/customer.rb'
require 'csv'
require 'pry-byebug'

class CustomerRepository
  attr_accessor :customers, :next_id
  attr_reader :csv_path

  def initialize
    @customers = []
    @csv_path = "../data/customers.csv"
    @next_id = 1
    parse
  end
  
  def add(customer)
    customer.customer_id = @next_id
    @customers << customer
    @next_id += 1
    store  
  end

  def all
    @customers
  end

  def find_customer(id)
    customer = @customers.select { |customer| customer.customer_id == id }
    customer[0]
  end

  def find_index(customer)
    @customers.find_index(customer)
  end

  def delete(index)
    @customers.delete_at(index)
  end
  
  def swap(customer, index)
    @customers[index] = customer 
    store
  end

private

  def parse
    csv_options = { headers: :first_row, header_converters: :symbol }
    filepath = @csv_path
    CSV.foreach(filepath, csv_options) do |row|
      row[:customer_id] = row[:customer_id].to_i
      @customers << Customer.new(row)
      @next_id = row[:customer_id]
    end
    @next_id += 1 unless @customers.size == 0
  end
  
  def store
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    filepath = @csv_path

    CSV.open(filepath, 'wb', csv_options) do |csv|
      csv << ['customer_id', 'customer_name', 'customer_address']
      @customers.each { |customer| csv << ["#{customer.customer_id}", "#{customer.  customer_name}", "#{customer.customer_address}"]}
    end
  end
end
