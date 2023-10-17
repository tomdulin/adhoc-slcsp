require 'csv'

class Reader
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
  end
  
  def read
    CSV.read(@file_path, headers: true)
  end
end