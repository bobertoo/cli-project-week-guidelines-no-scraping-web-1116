require 'pry'

class NomadAdapter

  attr_accessor :response, :data

  def initialize
    @response = RestClient.get('https://nomadlist.com/api/v2/list/cities', :timeout => 90000000)
    @data = JSON.parse(response)
  end

  def search_hash(query)
    result = data["result"].detect do | city |
      city["info"]["city"]["name"] == query
    end
  end

  def top_airbnb
    airbnb_sorted = data["result"].sort do |city1, city2|
      city1["cost"]["airbnb_median"]["USD"] <=> city2["cost"]["airbnb_median"]["USD"]
    end
    airbnb_sorted.delete_if {|city| city["cost"]["airbnb_median"]["USD"] == 0}
    10.times do |index|
      puts "#{index+1}. #{airbnb_sorted[index]["info"]["city"]["name"]} Airbnb listings cost $#{airbnb_sorted[index]["cost"]["airbnb_median"]["USD"]} on average".green
     end
  end

  def lgbt_friendly
    lgbt_sorted = data["result"].sort do |city1, city2|
      city2["scores"]["lgbt_friendly"] <=> city1["scores"]["lgbt_friendly"]
    end
    10.times do |index|
      puts "#{index+1}. #{lgbt_sorted[index]["info"]["city"]["name"]} - LGBT score: #{lgbt_sorted[index]["scores"]["lgbt_friendly"]}".green
     end
  end


  def internet_speed
    internet_sorted = data["result"].sort do |city1, city2|
      city2["info"]["internet"]["speed"]["download"] <=> city1["info"]["internet"]["speed"]["download"]
    end
    10.times do |index|
      puts "#{index+1}. #{internet_sorted[index]["info"]["city"]["name"]} - Download speed: #{internet_sorted[index]["info"]["internet"]["speed"]["download"]} mbps".green
     end
  end

end
