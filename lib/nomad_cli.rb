class NomadCLI

  attr_accessor :flag
  @flag = false

  def call
    welcome
  end

  def welcome
    puts "Hi! I'm Ask Travel Jeeves. I know everything about cities. EVERYTHING."
    choice
  end

  def choice
    puts "\nEnter \'chart\' for top 10 charts, \'search\' to search for a city
    or \'exit\' to exit."
    print "\nEnter your command: "
    user_input = gets.strip


    if user_input == "search"
      print "\nEnter your city: "
      city_query = gets.strip.capitalize
      city = get_city(city_query)
      main(city)
    elsif user_input == "help"
      # help method
    elsif user_input == "exit"
      puts "Goodbye"
    elsif user_input == "chart"
      charts
    else
      puts "Invalid option. Try harder.\n"
      welcome
    end
  end

  def get_city(user_input)
    City.new(NomadAdapter.new.search_hash(user_input))
  end

  def charts
    puts "\nThis will list out the top 10 cities for:\n\n"
    puts "    1. Cheap Airbnb listings"
    puts "    2. LGBT friendliness"
    puts "    3. Internet speed"
    chart_choice_runner
  end

  def chart_choice_runner
    puts "\nEnter 1, 2, 3, or exit to return to the main menu."
    print "\nEnter your choice here: "
    user_input = gets.strip
    if user_input == "1"
      NomadAdapter.new.top_airbnb
    elsif user_input == "2"
      NomadAdapter.new.lgbt_friendly
    elsif user_input == "3"
      NomadAdapter.new.internet_speed
    elsif user_input == "exit"
      choice
    else
      chart_choice_runner
    end
    choice
  end

  def main(city)

    if !flag
      print "\nWelcome to #{city.city_name}, #{city.country_name}! "
      print "🇺🇸\n" if city.country_name == "United States"
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
      print "\nChoose 1, 2, 3 or 4, or exit: "
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
