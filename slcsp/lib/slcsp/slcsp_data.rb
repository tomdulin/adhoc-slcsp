class SlcspData < Storable
  private

  def load_and_index
    Reader.new(file_path).read.each{|args| @data[args["zipcode"]] << '' }
  end
end