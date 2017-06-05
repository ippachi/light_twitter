module LightTwitter
  module Timeline
    def home_timeline
      content("home")
    end

    def mentions_timeline
      content("mentinos")
    end

    def user_timeline
      content("user")
    end

    private
      def content(str)
        response = @endpoint.get("https://api.twitter.com/1.1/statuses/#{str}_timeline.json") 
        JSON.parse(response.body).each do |twieet_info|
          puts twieet_info["user"]["name"]
          puts twieet_info["text"]
          puts 
        end
      end
  end
end
