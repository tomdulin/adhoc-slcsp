class Storable
    attr_reader :data
  
    def initialize
      @data = Hash.new{|hash, key| hash[key] = []}
      load_and_index
    end

    protected
    def log
      @log ||= Log.instance
    end

    def load_and_index
    end
  
    private
  
    def file_path 
      File.join(__dir__, 'data', "#{self.class.to_s.downcase.delete_suffix('data')}.csv")
    end
end