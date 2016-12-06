class NomadCLI

  attr_accessor :flag
  @flag = false

  def call
    welcome
  end

  def welcome
    puts "Hi! I'm Ask Travel Jeeves. I know everything about cities. EVERYTHING."
    puts "Enter \'chart\' for top 10 charts, \'search\' to search for a city
    or \'exit\' to exit."
    choice
  end

  def choice
    user_input = gets.strip


    if user_input == "search"
      puts "Enter your city:"
      city_query = gets.strip.capitalize
      city = get_city(city_query)
      main(city)
    elsif user_input == "help"
      # help method
    elsif user_input == "exit"
      puts "Goodbye"
    elsif user_input == "chart"
      # enter chart menu
    else
      puts "Invalid option. Try harder."
      welcome
    end
  end

  def get_city(user_input)
    City.new(NomadAdapter.new(user_input).search_hash)
  end

  def main(city)

    if !flag
      puts "\nWelcome to #{city.city_name}, #{city.country_name}!"
      puts "\nChoose an option from the menu to get started."
    else
      puts "\nEnter another choice or enter \'exit\' to exit."
    end
      puts "\nMENU:\n=========="
      puts "    1. Does my city have legal weed?"
      puts "    2. What's my city's average Airbnb price?"
      puts "    3. What's the weather like right now?"
      puts "    4. What's the average internet speed?"
      puts "=========="
      print "Choose 1, 2, 3 or 4, or exit: "
    choice_runner(city)

  end

  def choice_runner(city)
    user_input = gets.strip
    if user_input.to_s == "1"
      city.weed?
    elsif user_input.to_s == "2"
      city.av_airbnb
    elsif user_input.to_s == "3"
      city.weather
    elsif user_input.to_s == "4"
      city.inet_speed
    elsif user_input != "exit"
      puts "PLEASE PUT IN A VALID OPTION"
    end
    @flag = true
    if user_input == "exit"
      puts "Goodbye."
    else
      main(city)
    end
  end


end
