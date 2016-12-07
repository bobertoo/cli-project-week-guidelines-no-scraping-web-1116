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
      if hash["tags"].include?("legal weed")
        puts "HELLz YA".green
      else
        puts "nah".red
      end
      sleep(0.5)
    end

    def av_airbnb
      puts "$#{hash["cost"]["airbnb_median"]["USD"]} USD".green
    end

    def inet_speed
      puts "#{hash["info"]["internet"]["speed"]["download"]}mbps".green
    end

end
