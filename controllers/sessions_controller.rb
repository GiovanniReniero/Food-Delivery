require_relative "../repos/employee_repository.rb"

class SessionsController
  attr_reader :session_view, :employee_repository

  def initialize(attributes = {})
    @session_view = attributes[:session_view]
    @employee_repository = attributes[:employee_repository]
  end

  def login
    username = @session_view.ask_for('username')
    password = @session_view.ask_for('password')
    result = @employee_repository.find_employee(username, password)
    @session_view.not_registered if result.empty?
  end

end