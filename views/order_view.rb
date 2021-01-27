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
    list.each { |order| puts " #{order.order_id}.  #{order.meal.name} /customer: #{order.customer.customer_name} /delivery guy: #{order.employee.employee_username} /status:#{order.delivered}" }  
  end
  

end