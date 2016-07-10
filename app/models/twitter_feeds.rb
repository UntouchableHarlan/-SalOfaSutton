class TwitterFeeds
  def initialize
    @client = Twitter::REST::Client.new do |config|
          config.consumer_key        = "062IXtPo0LP9RPHSqSdyAC5wY"
          config.consumer_secret     = "tPw49Lbe8zhguvNS8WZK5fAPGO9AlJ3wtNX6Uhn87eYYU3YjqR"
          config.access_token        = "582516066-BJcbKpMsRrlfLux2fGedUSbqQTIBn5E1D37ouLwL"
          config.access_token_secret = "uCc7VRBzRT4ZUm5kLZwpXwtnHBeB0EVC8vccIO4sjLnJ2"
      end
  end

  def tweet(message)
    @client.search("to:justinbieber marry me", result_type: "recent").take(3).collect do |tweet|
  "#{tweet.user.screen_name}: #{tweet.text}"
end
  end

end
