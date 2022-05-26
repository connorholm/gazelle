require 'httparty'

class TopicTaggingApi
    
    def tagging_request(q)
        key = ENV["X_RAPIDAPI_KEY"]
        
        api_url = "https://twinword-topic-tagging.p.rapidapi.com/generate/"
        

        query_parameters = { 
            :"text" => q,
        }
        headers = {
            'x-rapidapi-host' => 'twinword-topic-tagging.p.rapidapi.com',
            'x-rapidapi-key' => key
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