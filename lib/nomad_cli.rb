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
    puts "Welcome to #{city.city_name}!"
    puts "Choose an option from the menu to get started."

    # Add conditionals to check for invalid responses

    user_input = gets.strip

    puts "MENU: \n =========="
    puts "    1. Does my city have legal weed?"
    puts "    2. What's my city's average Airbnb price?"
    puts "    3. What's the weather like right now?"

  end


end
