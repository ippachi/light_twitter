module LightTwitter
  module Timeline

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
