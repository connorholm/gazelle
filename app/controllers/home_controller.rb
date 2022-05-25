require 'net/http'
require 'api/weather_api'
class HomeController < ApplicationController
  helper_method :search_weather

  def index
    puts "Params: #{params}"
    if !(params[:city] == nil or params[:city] == "")
      response = search_weather(params[:city])
      @data = response
    end
    # key = ENV["OPEN_WEATHER_API_KEY"]
    
    # url = "https://api.openweathermap.org/data/2.5/weather?lat=44.854031&lon=-93.460167&appid=#{key}"
    # uri = URI(url)
    # response = Net::HTTP.get(uri)
    # @data = JSON.parse(response)
    # api = WeatherApi.new()
    # url = api.unique_url
    # @data = url
  end

  def search_weather(city)
    api = WeatherApi.new()
    url = api.unique_url(city)
    url
  end
end
