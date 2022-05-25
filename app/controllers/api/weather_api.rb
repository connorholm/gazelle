require 'httparty'

class WeatherApi
    
    def unique_url(q)
        key = ENV["OPEN_WEATHER_API_KEY"]
        
        api_url = "https://api.openweathermap.org/data/2.5/weather"
        
        # query_latlog = { 
        #     :"lat" => lat,
        #     :"lon" => long,
        #     :"appid" => key,
        #     :"units" => "imperial"
        # }
        query_city = { 
            :"q" => q,
            :"appid" => key,
            :"units" => "imperial"
        }
        response = HTTParty.get(
            api_url, 
            :query => query_city,
        )
        json = JSON.parse(response.body)
        puts json
        json
    end
end