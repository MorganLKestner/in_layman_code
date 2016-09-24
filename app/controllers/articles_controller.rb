class ArticlesController < ApplicationController
	  def index
      base_uri = "https://newsapi.org/v1/articles?source=techcrunch&sortBy=top&apiKey="
      @response = HTTParty.get(base_uri + '45b19b28504f4485abc1395aa63a6b77')["articles"]

  end


  def show
     @response
    end

    
   def api_key
    ENV['NEWS_API_KEY']
  end

end
