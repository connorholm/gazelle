require 'api/topic_tagging_api'

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
  end

  def page_inspect
  end

  def get_tags(text)
    api = TopicTaggingApi.new()
    url = api.tagging_request(text)
    url
  end
end
