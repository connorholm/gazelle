require 'httparty'

class WeatherApi
    
    def unique_url
        key = ENV["OPEN_WEATHER_API_KEY"]
        
        api_url = "https://api.openweathermap.org/data/2.5/weather"
        
        query_latlog = { 
            :"lat" => "44.854031",
            :"lon" => "-93.460167",
            :"appid" => key,
            :"units" => "imperial"
        }
        response = HTTParty.get(
            api_url, 
            :query => query_latlog,
        )
        json = JSON.parse(response.body)
        json
    end
end