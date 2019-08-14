require "httparty"
require "addressable/uri"

module Frameio
  class APIResource
    BASE_URL = "https://api.frame.io/v2".freeze
    REDIRECT_URI = ENV['FRAMEIO_REDIRECT_URI']
    HEADERS = {
      "Content-Type" => "application/x-www-form-urlencoded"
    }.freeze

    include HTTParty
    debug_output $stdout
    format :json
    headers HEADERS

    def self.authorize_bearer_header(frame_token)
      if frame_token.nil?
        raise "Please provide a valid frame token!"
      else
        { Authorization: "Bearer #{frame_token.access_token}" }
      end
    end
  
    def self.authorize_basic_auth_header
      { Authorization: "Basic #{self.encoded_secret}" }
    end
  
    def self.encoded_secret
      Base64.strict_encode64("#{ENV['FRAMEIO_CLIENT_ID']}:#{ENV['FRAMEIO_CLIENT_SECRET']}")
    end

    def self.request(method, url, headers, body = {})
      HTTParty.send(method, url, :headers => headers, :body => body)
    end

    def self.to_query_string(query_values = {})
      uri = Addressable::URI.new
      uri.query_values = query_values
      uri.query
    end

    def handle_response(response) 
      response.success? ? response : handle_error(response)
    end

    def handle_error(response)
      if response.class == HTTParty::Response
        raise HTTParty::ResponseError, response
      end

      raise StandardError, "Frame - Unknown response error" 
    end

  end
end