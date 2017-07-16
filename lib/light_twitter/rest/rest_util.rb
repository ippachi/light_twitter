module LightTwitter
  module Rest
    module RestUtil    
      def output_tweet tweets, &block

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