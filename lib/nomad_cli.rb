class NomadCLI
  def call
    welcome
  end

  def welcome
    print "Hello! Enter a city name: "
    user_input = gets.split
  end
end
