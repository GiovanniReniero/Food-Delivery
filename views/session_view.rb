
class SessionView
  def initialize(session_view)
    @session_view = session_view
  end
  
  def ask_for(something)
    puts "Please insert #{something}..."
    print ' > '
    gets.chomp
  end

  def not_registered
    puts "You are not a registered employee, please try again"    
  end
  

end