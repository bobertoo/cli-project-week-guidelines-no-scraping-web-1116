require 'pry'

class NomadAdapter


  attr_reader :query
  attr_accessor :response, :data
  def initialize(query)
    @query = query.to_s
    @response = RestClient.get('https://nomadlist.com/api/v2/list/cities')
    @data = JSON.parse(response)
  end
  #
  # def list_cities
  #   data["result"].collect {|x| x["info"]["city"]["name"]}
  # end

  def search_hash
    result = data["result"].detect do | city |
      city["info"]["city"]["name"] == @query
    end
  end
end
