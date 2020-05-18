module Frameio
  class Client
    include HTTParty
    format :json
    
    attr_reader :token
    
    def initialize(token)
      @token = token
    end
        
    def create(request_path, body:)
      request(:post, request_path, body)
    end

    def delete(request_path)
      request(:delete, request_path)
    end

    def get(request_path)
      request(:get, request_path)
    end

    def update(request_path, body:)
      request(:put, request_path, body)
    end

    def to_query_string(query_values: {})
      uri = Addressable::URI.new
      uri.query_values = query_values
      uri.query
    end

    def to_ostruct(hash)
      OpenStruct.new(hash.each_with_object({}) do |(key, val), memo|
        memo[key] = val.is_a?(Hash) ? to_ostruct(val) : val
      end)
    end

    def auth_headers
      { 
        Authorization: "Bearer #{access_token}"
      }
    end

    private

    def access_token
      access_token =  @token[:token]&.access_token if @token.methods.include? :access_token
      access_token = @token[:token][:access_token] if @token.class.to_s == "Hash"
      return access_token
      if access_token.empty?
        raise "Please supply a valid frameio token with an access_token attribute or method"
      end
    end

    def base_url
      "https://api.frame.io/v2"
    end

    def request(method, path, body: {})
      if body.empty?
        HTTParty.send(method, "#{base_url}""#{path}", headers: auth_headers)
      else 
        HTTParty.send(method, "#{base_url}""#{path}", headers: auth_headers, body: body)
      end
    end
    
  end
end