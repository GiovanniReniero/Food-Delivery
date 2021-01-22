require_relative "../models/customer.rb"
require 'pry-byebug'
class CustomerView

  def initialize(customer_view)
    @customer_view = customer_view    
  end
  
  def new_customer
    puts "What's the new customer's name?"
    print "> "
    name = gets.chomp
    puts "...and what is #{name}'s address?"
    print "> "
    address = gets.chomp
    new_customer = Customer.new(customer_name: name, customer_address: address)
  end
  
  def all_customers(list)
    list.each { |customer| puts "#{customer.customer_id}. #{customer.customer_name}........#{customer.customer_address}"}
  end

  def no_customers
    puts " Alas, this outfit has no customers right now...."
  end
  

end