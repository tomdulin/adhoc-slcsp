class ZipsData < Storable
  def codes(area)
    data.has_key?(area) ? data[area] : []
  end

  def load_and_build_zips_in_scope(targeted_zips)
    zip_dictionary= Hash.new{|hash, key| hash[key] = []}
    
    Reader.new(file_path).read.each do |args|
      next unless targeted_zips.has_key?(args["zipcode"]) # only store zip codes listed in slcsp list
      zip_dictionary[args["zipcode"]] << args["rate_area"] 
    end

    # generate a lookup table for areas to zip codes
    targeted_zips.keys.each do |zip|
      zip_dictionary[zip].uniq!                 # potential for zips in multiple county codes within an area
      if zip_dictionary[zip].length == 1        # only want zips associated with one area
        data[zip_dictionary[zip].first] << zip
      end
    end 
  end
end