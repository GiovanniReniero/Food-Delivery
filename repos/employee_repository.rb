require "csv"
require_relative "../models/employee.rb"

class EmployeeRepository
  attr_accessor :employees
  attr_reader :filepath, :next_id

  def initialize
    @employees = []
    @filepath = "../data/employees.csv"
    @next_id = 1
    parse unless File.zero?(@filepath)
  end
  
  def all
    @employees
  end

  def find_employee(username, password)
    @employees.find { |employee| employee.employee_username == username && employee.employee_password == password }
  end

  def find_employee_by_username(username)
    @employees.find { |employee| employee.employee_username == username }
  end

  def find_employee_by_password(password)
    @employees.find { |employee| employee.employee_password == password }
  end

  def find_employee_by_id(employee_id)
    @employees.find { |employee| employee.employee_id == employee_id }
  end
  
  def all_delivery_guys
    @employees.select { |employee| employee.employee_role == 'delivery_guy' }
  end
  
private

  def parse
    csv_options = { headers: :first_row, header_converters: :symbol }
    filepath = @filepath
    CSV.foreach(filepath, csv_options) do |row|
      row[:employee_id] = row[:employee_id].to_i
      @employees << Employee.new(row)
      @next_id = row[:employee_id]
    end 
    @next_id += 1 unless @employees.size == 0
  end
end
