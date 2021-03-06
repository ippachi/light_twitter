require 'light_twitter/rest/rest_util'
module LightTwitter
  module Rest
    module Timeline
      prepend RestUtil

      def self.define_timeline_method(name)
        define_method "#{name}_timeline" do |&block|
          content(name, &block)
        end
      end

      define_timeline_method :home
      define_timeline_method :user
      define_timeline_method :mentions

      private
        def content(str,&block)

          response = @access_token.get("https://api.twitter.com/1.1/statuses/#{str}_timeline.json") 

          raise response.code if response.code != "200"

          tweets = []
          tweet = Struct.new(:created_at, :text, :name, :favorite, :retweet)

          JSON.parse(response.body).each do |tweet_info|
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
