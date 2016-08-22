class StaticController < ApplicationController
  require 'uri'
  require 'rspotify'

  def index
    @random = Giphy.trending(limit: 12)
    # redirect_to new_user_path if session[:user_id].nil?
  end

  def tweet
    if params[:q] == "" || params[:q].match(" ")
      redirect_to root_path
    else
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = "062IXtPo0LP9RPHSqSdyAC5wY"
        config.consumer_secret     = "tPw49Lbe8zhguvNS8WZK5fAPGO9AlJ3wtNX6Uhn87eYYU3YjqR"
        config.access_token        = "582516066-BJcbKpMsRrlfLux2fGedUSbqQTIBn5E1D37ouLwL"
        config.access_token_secret = "uCc7VRBzRT4ZUm5kLZwpXwtnHBeB0EVC8vccIO4sjLnJ2"
      end
      # @tracks = RSpotify::Track.search(params[:q], limit: 1)
      @tracks = RSpotify::Track.search(params[:q], limit: rand(1..10))
      @specific_track = RSpotify::Track.search(params[:q], limit: 1).first

      Giphy::Configuration.configure do |config|
        config.api_key = "dc6zaTOxFJmzC"
      end

      @picture = Giphy.search("#{params[:q]}", {limit: rand(1..10)})
    end

  end
end
