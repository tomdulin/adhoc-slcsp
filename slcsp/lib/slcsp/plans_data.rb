class PlansData < Storable
  def initialize
    @data = Hash.new{|hash, key| hash[key] = Datum.new(key)}
  end

  def load_and_build_rates(zips)
    Reader.new(file_path).read.each do |args|
      next unless args['metal_level'] === 'Silver'
      zips.codes(args["rate_area"]).each do |zip|
        data[zip].rates << args['rate'].to_f
      end
    end
  end
end