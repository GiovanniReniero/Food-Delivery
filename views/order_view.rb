require 'pry-byebug'

class OrderView
 attr_reader :order_view

  def initialize(order_view)
    @order_view = order_view
  end
  
  def new_order(something)
    puts ""
    puts ""
    puts "New Order, select #{something}..."
    print "#{something} number > "
    gets.chomp.to_i
  end
  
  def all_orders(list)
    puts "All orders ..."
    list.each { |order| order.delivered == false ? (puts " [ ]  #{order.order_id}. *#{order.employee.employee_username}* / #{order.meal.name} /customer: #{order.customer.customer_name} ")  : (puts " [X]  #{order.order_id}. *#{order.employee.employee_username}*  #{order.meal.name} /customer: #{order.customer.customer_name} / *#{order.employee.employee_username}* ") }  
  end

  def delivery_guy_orders(list)
    puts "Your undelivred orders:"
    list.each { |order|  puts "#{order.order_id}. *#{order.employee.employee_username}* / #{order.meal.name} /customer: #{order.customer.customer_name} "}
  end
  


end
