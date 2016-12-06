class City
  attr_accessor :city_name, :country_name

    def initialize(hash)
      @hash = hash
      @country_name = hash["info"]["country"]["name"]
      @city_name = hash["info"]["city"]["name"]
    end

    def weed?
      hash["tags"].include?("legal weed")
    end

    def internet_speed
      hash["info"]["internet"]["speed"]["download"]
    end

end
