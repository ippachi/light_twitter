require 'light_twitter/rest/timeline'

module LightTwitter
  class User
    include Rest::Timeline
    def initialize(consumer_key, consumer_seacret,
                   access_token, access_seacret)

    @consumer = OAuth::Consumer.new(consumer_key,
                                    consumer_seacret,
                                    site: 'https://api.twitter.com/')
    @endpoint = OAuth::AccessToken.new(@consumer,
                                       access_token,
                                       access_seacret)
    end
  end
end
