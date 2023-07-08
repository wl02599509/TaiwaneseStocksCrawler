require 'rest-client'

class RequestApi
  def initialize(url)
    @response = RestClient.get(url)
  end

  def parsed_json
    JSON.parse @response.body
  end
end