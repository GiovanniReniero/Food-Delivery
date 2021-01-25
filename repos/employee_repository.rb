require "csv"
require_relative "../models/employee.rb"
require "pry-byebug"

class EmployeeRepository
  attr_accessor :employees
  attr_reader :filepath, :next_id
  
  def initialize
    @employees = []
    @filepath = "../data/employees.csv"
    @next_id = 1
    parse
  end
  
  
  def add(employee)
    employee.employee_id = @next_id
    @employees.push(employee)
    @next_id += 1
    store
  end
  
  def all
    @employees
  end

  def delete
    # code
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

  def store
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    filepath = @filepath

    CSV.open(filepath, 'wb', csv_options) do |csv|
      csv << ['employee_username', 'employee_password', 'employee_role', 'employee_id']
      @employees.each { |employee| csv << ["#{employee.employee_username}", "#{employee.employee_password}", "#{employee.employee_role}", "#{employee.employee_id}"] }
    end
  end


end