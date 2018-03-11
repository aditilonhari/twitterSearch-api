
class ApplicationController < ActionController::API
	def index
		client = Twitter::REST::Client.new do |config|
          config.consumer_key        = ENV['CONSUMER_KEY']
          config.consumer_secret     = ENV['CONSUMER_SECRET']
          config.access_token        = ENV['ACCESS_TOKEN']
          config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
        end
        
        query_str = query_params[:q]
    	@tweets = client.search("#{query_str} -rt")
		render json: @tweets
	end

	private

	def query_params
		params.permit(:q)
	end
end
