class OrderView
 attr_reader :order_view

  def initialize(order_view)
    @order_view = order_view
  end
  
  def new_order(something)
    puts "New Order, select #{something}..."
    print "#{something} number > "
    gets.chomp.to_i
  end
  
  def all_orders(list)
    puts "All orders ..."
    list.each { |order| order.delivered == false ? (puts " [ ] #{order.order_id}.  #{order.meal.name} /customer: #{order.customer.customer_name} / * #{order.employee.employee_username}* ")  : (puts " [X] #{order.order_id}.  #{order.meal.name} /customer: #{order.customer.customer_name} / * #{order.employee.employee_username}* ") }  
  end
end
