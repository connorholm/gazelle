require 'api/topic_tagging_api'
require 'api/keywords_api'
require 'api/page_inspect_api'

class ToolsController < ApplicationController
  def index
  end

  def tagging
    if !(params[:text] == nil or params[:text] == "")
      response = get_tags(params[:text])
      @tagging_response = response
      @tagging_search = params[:text]
    end
  end

  def keywords
    if !(params[:search] == nil or params[:search] == "")
      response = get_keywords(params[:search])
      @keywords_response = response
      @keywords_search = params[:search]
    end 
  end

  def page_inspect
    if !(params[:url] == nil or params[:url] == "")
      response = get_page_inspect(params[:url])
      @page_inspect_response = response
      @page_inspect_search = params[:url]
    end
  end

  def get_tags(text)
    api = TopicTaggingApi.new()
    url = api.tagging_request(text)
    url
  end

  def get_keywords(search)
    api = KeywordApi.new()
    url = api.keyword_request(search)
    url
  end

  def get_page_inspect(url)
    api = PageInspectApi.new()
    data = api.page_inspect_request(url)
    data
  end
end
