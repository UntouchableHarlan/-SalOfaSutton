require 'uri'
require 'rspotify'
class StaticController < ApplicationController

  def index
    @random = Giphy.trending(limit: 12)
    # redirect_to new_user_path if session[:user_id].nil?
  end

  def tweet
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ""
      config.consumer_secret     = ""
      config.access_token        = ""
      config.access_token_secret = ""
    end
    @tracks = RSpotify::Track.search(params[:q], limit: 1)

    Giphy::Configuration.configure do |config|
      config.api_key = ""
    end

    @picture = Giphy.search("#{params[:q]}", {limit: 1})
  end
end
