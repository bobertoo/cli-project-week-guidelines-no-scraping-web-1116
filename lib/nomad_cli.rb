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
    puts "\nEnter \'chart\' for top 10 charts, \'search\' to search for a city or \'exit\' to exit"
    print "\nEnter your command: "
    user_input = gets.strip

    unless user_input == "exit"
      if user_input == "search"
        city_search
      elsif user_input == "help"
        sleep(0.25)
        help
      elsif user_input == "chart"
        charts
      else
        puts "Invalid option. Try harder.\n\n"
        welcome
      end
    end
    puts "Shutting down. (◡ ‿ ◡ ✿)".light_red
    exit
    # Note: previous build did not use explicit exit
    # For some reason it would puts "Goodbye" and loop back in
    # ¯\_(ツ)_/¯???
  end

  def help
    puts "\nsearch — Allows user to search for a city and get local data."
    puts "chart — Allows user to get the top 10 cities for several categories."
    puts "help — Pulls up this."
    puts "exit — Closes the program"
    choice
  end

  def city_search
    print "\nEnter your city or type \'exit\' to cancel: "
    city_query = gets.strip.split(" ").map(&:capitalize).join(" ")
    if city_query == "Exit"
      puts "Returning to main menu...".red
      choice
    else
      city = get_city(city_query)
      main(city)
    end
  end

  def get_city(user_input)
    search_result = NomadAdapter.new.search_hash(user_input)
    if search_result.nil?
      puts "No cities with that name found. Try again or type \'exit\' to exit."
      city_search
    else
      City.new(search_result)
    end
  end

  def charts
    puts "\nTOP 10 CHARTS_______________\n\n"
    puts "    1. Cheap Airbnb listings"
    puts "    2. LGBT friendliness"
    puts "    3. Internet speed"
    puts "____________________________"
    chart_choice_runner
  end

  def chart_choice_runner
    puts "\nEnter 1, 2, 3, or exit to return to the main menu."
    print "\nEnter your choice here: "
    user_input = gets.strip
    unless user_input == "exit"
      puts
      if user_input == "1"
        NomadAdapter.new.top_airbnb
      elsif user_input == "2"
        NomadAdapter.new.lgbt_friendly
      elsif user_input == "3"
        NomadAdapter.new.internet_speed
      end
      charts
      chart_choice_runner
    end
    puts "Returning to main menu.".red
    choice

  end

  def main(city)

    if !flag
      print "\nWelcome to #{city.city_name}, #{city.country_name}! "
      print "🇺🇸\n" if city.country_name == "United States"
      puts "\nChoose an option from the menu to get started."
    else
      puts "\nEnter another choice or enter \'exit\' to go to main menu."
    end
      puts "\nMENU:\n=========="
      puts "    1. Does my city have legal weed?"
      puts "    2. What's my city's average Airbnb price?"
      puts "    3. What's the weather like right now?"
      puts "    4. What's the average internet speed?"
      puts "=========="
      print "\nChoose 1, 2, 3 or 4, or exit to go back to main menu: "
    city_choice_runner(city)

  end

  def city_choice_runner(city)
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
    if user_input == "exit"
      puts "Returning to main menu.\n".red
      user_input == ""
      @flag = false
      welcome
    else
      @flag = true
      main(city)
    end
  end


end
