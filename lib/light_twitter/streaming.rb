require 'net/http'
require 'json'
require 'eventmachine'
require 'oauth'

module LightTwitter
  module Streaming
    def user_streaming
      uri = URI.parse(URI.encode "https://userstream.twitter.com/1.1/user.json")

      @https = Net::HTTP.new(uri.host, uri.port)
      @https.use_ssl = true
      @https.verify_mode = OpenSSL::SSL::VERIFY_PEER

      @request = Net::HTTP::Get.new(uri.request_uri, "Accept-Encoding" => "identity")

      @request.oauth!(@https, @consumer, @access_token)

      @https.start do |http|
        puts "start"
        puts "if you finish streaming type 'quit'"
        http.request(@request) do |response|
          raise "limit" if response.code.eql? "420"
          EM.run do
            EM.defer do
              response.read_body do |str|
                next if !str.include? "created_at"
                begin
                  tweet = JSON.parse(str)
                rescue
                  next
                end
                puts tweet["text"]
                puts tweet["user"]["name"]
                puts
                puts
              end
            end

            loop do
              if gets.chomp.eql? "quit"
                return 
              end
            end

          end
        end
      end

    end
  end
end
