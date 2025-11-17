require "rest-client"
require "json"

class GetGoogleCoffeeListService
  def initialize(latitude, longitude, radius = 5000)
    @latitude = latitude
    @longitude = longitude
    @radius = radius
  end

  def call
    begin
      api_key = Rails.application.credentials.google_secret_key
      base_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=coffee+shops&location=#{@latitude},#{@longitude}&radius=#{@radius}&key=#{api_key}"

      response = RestClient.get(base_url)

      JSON.parse(response.body)

    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end
