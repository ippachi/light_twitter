module LightTwitter
  module Rest
    module Search
      def search word, &block
        response = @access_token.get(URI.encode("https://api.twitter.com/1.1/search/tweets.json?q=#{word}"))

        raise response.code if response.code != "200"

        tweets = []
        tweet = Struct.new(:created_at, :text, :name, :favorite, :retweet)

        JSON.parse(response.body)["statuses"].each do |tweet_info|
          tweets << tweet.new(tweet_info["created_at"],
                              tweet_info["text"],
                              tweet_info["user"]["name"],
                              tweet_info["favorite_count"],
                              tweet_info["retweet_count"]) 
        end

        output_tweet(tweets, &block)

      end
    end
  end
end