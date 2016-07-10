require 'uri'
class StaticController < ApplicationController
  def index
    # redirect_to new_user_path if session[:user_id].nil?
  end

  def tweet
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ""
      config.consumer_secret     = ""
      config.access_token        = ""
      config.access_token_secret = ""
    end
  end

  def show

  end
end
