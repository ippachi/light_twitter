require 'light_twitter/rest/timeline'
require 'light_twitter/streaming'

module LightTwitter
  class User
    include Rest::Timeline
    include Streaming
    def initialize(consumer_key, consumer_seacret,
                   access_token, access_seacret)

    @consumer = OAuth::Consumer.new(consumer_key,
                                    consumer_seacret,
                                    site: 'https://api.twitter.com/')
    @access_token = OAuth::AccessToken.new(@consumer,
                                       access_token,
                                       access_seacret)
    end
  end
end
