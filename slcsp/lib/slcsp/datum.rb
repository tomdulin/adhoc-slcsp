class Datum
  attr_reader :zip_code, :rates, :length

  def initialize(zip_code)
    @length = 0
    @zip_code = zip_code
    @rates = []
  end

  def to_csv
    "#{zip_code}, #{second_least_rate}"
  end

  private

  def second_least_rate
    return '' if rates.empty?
    rates.delete(rates.min)
    rates.min
  end
end
