class BaseRepository
  attr_accessor :employees
  attr_reader :filepath, :next_id
  
  def initialize
    @elements = []
    @filepath = "../data/file.csv"
    @next_id = 1
    parse if File.exists?(@filepath)
  end
  
  
  def add(element)
    element.element_id = @next_id
    @elements.push(element)
    @next_id += 1
    store
  end
  
  def all
    @elements
  end

  
private

  def parse
    csv_options = { headers: :first_row, header_converters: :symbol }
    filepath = @filepath
    CSV.foreach(filepath, csv_options) do |row|
      row[:element_id] = row[:element_id].to_i
      @elements << Element.new(row)
      @next_id = row[:element_id]
    end 
    @next_id += 1 unless @elements.size == 0
  end

  def store
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    filepath = @filepath

    CSV.open(filepath, 'wb', csv_options) do |csv|
      csv << ['element_username', 'element_password', 'element_role', 'element_id']
      @elements.each { |element| csv << element.to_csv_row }
    end
  enlement