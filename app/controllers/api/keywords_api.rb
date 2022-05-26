require 'httparty'

class KeywordApi
    
    def keyword_request(q)
        key = ENV["X_RAPIDAPI_KEY"]
        
        api_url = "https://keywords4.p.rapidapi.com/google-topLevel-10-keywords"
        

        query_parameters = { 
            :"search" => q,
            :"country" => "us",
        }
        headers = {
            'X-RapidAPI-Host' => 'keywords4.p.rapidapi.com',
            'X-RapidAPI-Key' => key
        }
        response = HTTParty.get(
            api_url, 
            :query => query_parameters,
            :headers => headers,
        )
        json = JSON.parse(response.body)
        puts json
        json
    end
end