require 'uri'
class StaticController < ApplicationController
  def index
    # redirect_to new_user_path if session[:user_id].nil?
  end

  def tweet
    @client = Twitter::REST::Client.new do |config|
        
      end


    # @http = "#{tweet.user.screen_name}: #{tweet.text}"
    #
    # p @http.scheme

  end
end
