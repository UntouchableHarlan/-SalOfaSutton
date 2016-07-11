class TwitterFeeds
  def initialize
    @client = Twitter::REST::Client.new do |config|
          config.consumer_key        = ""
          config.consumer_secret     = ""
          config.access_token        = ""
          config.access_token_secret = ""
      end
  end

  def tweet
    @client.search("to:justinbieber marry me", result_type: "recent").take(3).collect do |tweet|
      "#{tweet.user.screen_name}: #{tweet.text}"
    end
  end

  def places
    salomon = @client.trends_available.map{|p| [p.id,p.name]}
      salomon.each do |location|
        location[1]
      end


  end

end
