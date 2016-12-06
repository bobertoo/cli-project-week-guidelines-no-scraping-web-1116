class City
  attr_accessor :city_name, :country_name, :hash

    def initialize(hash)
      @hash = hash
      @country_name = hash["info"]["country"]["name"]
      @city_name = hash["info"]["city"]["name"]
    end

    def weather
      puts "It is #{hash["info"]["weather"]["temperature"]["fahrenheit"]}℉ RIGHT NOWWW"
    end

    def weed?
      # binding.pry
      if hash["tags"].include?("legal weed")
        puts "HELLz YA"
      else
        puts "nah"
      end
    end

    def av_airbnb
      puts "$#{hash["cost"]["airbnb_median"]["USD"]} USD"
    end

    def inet_speed
      puts "#{hash["info"]["internet"]["speed"]["download"]}mbps"
    end

end
