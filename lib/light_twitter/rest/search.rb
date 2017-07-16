module LightTwitter
  module Rest
    module Search
      def search word
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

        if block_given?
          tweets.each do |tw|
            yield(tw)
          end

        else
          tweets.each do |tw|
            puts tw.created_at
            puts tw.text
            puts tw.name
            puts "RT: #{tw.favorite}"
            puts "FAV: #{tw.retweet}"
            puts 
          end
        end
      end
    end
  end
end