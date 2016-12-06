class NomadCLI
  def call
    welcome
  end

  def welcome
    puts "Hi! I'm Ask Travel Jeeves. I know everything about cities. EVERYTHING."
    puts "Enter a city name to get started: "
    user_input = gets.strip
    city = get_city(user_input)
    main(city)
  end

  def get_city(user_input)
    City.new(NomadAdapter.new(user_input).search_hash)
  end

  def main(city)
    puts "Welcome to #{city.city_name}, #{city.country_name}!"
    puts "Choose an option from the menu to get started."
    puts "MENU: \n =========="
    puts "    1. Does my city have legal weed?"
    puts "    2. What's my city's average Airbnb price?"
    puts "    3. What's the weather like right now?"
    puts "    4. What's the average internet speed?"
    puts "=========="
    print "Choose 1, 2, 3 or 4: "
    user_input = gets.strip
    if user_input.to_s == "1"
      city.weed?
    elsif user_input.to_s == "2"
      city.av_airbnb
    elsif user_input.to_s == "3"
      city.weather
    elsif user_input.to_s == "4"
      city.inet_speed
    else
      puts "PLEASE PUT IN A VALID OPTION"
    end
  end


end
