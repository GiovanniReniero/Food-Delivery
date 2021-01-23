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
  
  def customer_select
    puts "Please select which customer to edit or delete..."    
    print "number > "
    index = gets.chomp.to_i
  end

  def customer_edit(customer)
    id = customer.customer_id
    puts "#{customer.customer_id}. #{customer.customer_name}........#{customer.customer_address}"
    puts "Edit customer name..."
    print "new name > "
    name = gets.chomp
    puts "Edit customer address..."
    print "new address > "
    address = gets.chomp
    Customer.new(customer_id: id, customer_name: name, customer_address: address)
  end
end
