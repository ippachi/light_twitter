require "light_twitter/version"
require 'light_twitter/timeline'
require 'oauth'
require 'json'

module LightTwitter
  class User
    include Timeline
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
