require "httparty"
require "addressable/uri"

module Frameio
  class Resource
    include HTTParty
    base_uri 'https://api.frame.io/v2'
    debug_output $stdout
    headers "Content-Type" => "application/x-www-form-urlencoded"
    format :json

    def authorize_bearer_header(frame_token)
      if frame_token.nil?
        raise "Please provide a valid frame token!"
      else
        { Authorization: "Bearer #{frame_token.access_token}" }
      end
    end
  
    def request(method, path, frameio_token, body = {})
      HTTParty.send(method, path, authorize_bearer_header(frameio_token), body: body)
    end

    def to_query_string(query_values = {})
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