require 'httparty'

class PageInspectApi
    
    def page_inspect_request(q)
        key = ENV["X_RAPIDAPI_KEY"]
        
        api_url = "https://keyword-and-seo-page-inspect.p.rapidapi.com/page-inspect"
        

        body = { 
            :"url" => q,
        }
        headers = {
            'Content-Type' => 'application/json',
            'content-type' => 'application/json',
            'x-rapidapi-host' => 'keyword-and-seo-page-inspect.p.rapidapi.com',
            'x-rapidapi-key' => key
        }
        response = HTTParty.post(
            api_url, 
            :headers => headers,
            :body => body.to_json,
            
        )
        # begin
            json = JSON.parse(response.body)
            puts json
            return json
        # rescue JSON::ParserError => e
        #     return "Couldn't read url inputed"      
        # end  
    end
end