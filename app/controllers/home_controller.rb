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
  end

  def about
  end

  def contact
  end

  def privacy_policy
  end

  def terms_conditions
  end

  def search_weather(city)
    api = WeatherApi.new()
    url = api.unique_url(city)
    url
  end
end
