class StaticController < ApplicationController
  require 'uri'
  require 'rspotify'

  def index
    @random = Giphy.trending(limit: 12)
    # redirect_to new_user_path if session[:user_id].nil?
  end

  def tweet
    if params[:q] == ""
      redirect_to root_path
    else
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['CONSUMER_KEY']
        config.consumer_secret     = ENV['CONSUMER_SECRET']
        config.access_token        = ENV['ACCESS_TOKEN']
        config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
      end
      # @tracks = RSpotify::Track.search(params[:q], limit: 1)
      @tracks = RSpotify::Track.search(params[:q], limit: rand(5..20))
      @specific_track = RSpotify::Track.search(params[:q], limit: 1).first

      Giphy::Configuration.configure do |config|
        config.api_key = "dc6zaTOxFJmzC"
      end

      @picture = Giphy.search("#{params[:q]}", {limit: rand(1..10)})
    end

  end
end
