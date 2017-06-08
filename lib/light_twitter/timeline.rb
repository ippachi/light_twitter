module LightTwitter
  module Timeline
    def home_timeline(&block)
      content("home", &block)
    end

    def mentions_timeline(&block)
      content("mentinos",&block)
    end

    def user_timeline(&block)
      content("user",&block)
    end

    private
      def content(str,&block)

        response = @endpoint.get("https://api.twitter.com/1.1/statuses/#{str}_timeline.json") 
        timelines = []

        JSON.parse(response.body).each do |twieet_info|
          timelines << [twieet_info["user"]["name"], twieet_info["text"]]
        end

        if block_given?
          timelines.each do |timeline|
            yield(*timeline)
          end

        else
          timelines.each do |timeline|
            puts timeline[0]
            puts timeline[1]
            puts 
          end
        end


      end
  end
end
