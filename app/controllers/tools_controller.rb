require 'httparty'

class ToolsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
  end

  def tagging
    if !(params[:text] == nil or params[:text] == "")
      response = tagging_request(params[:text])
      @tagging_response = response
      @tagging_search = params[:text]
    end
  end

  def keywords
    if !(params[:search] == nil or params[:search] == "")
      @keywords_search = params[:search]
      assign_search()
      @keywords_response = keyword_request(params[:search])
    end 
  end

  def page_inspect
    if !(params[:url] == nil or params[:url] == "")
      response = page_inspect_request(params[:url])
      @page_inspect_response = response
      @page_inspect_search = params[:url]
    end
  end

  def assign_search()
    @search_keywords = true
  end

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
