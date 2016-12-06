require 'pry'

class NomadAdapter

  attr_reader :query
  def initialize(query)
    @query = query.to_s
  end

  def search_hash
    data = RestClient.get('https://nomadlist.com/api/v2/list/cities')
    data = JSON.parse(data)
    result = data["result"].detect do | city |
      city["info"]["city"]["name"] == @query
    end
  end
  
end
