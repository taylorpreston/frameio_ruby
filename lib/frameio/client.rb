require "./resources/accounts"
require "./resources/app_installs"
require "./resources/assets"
require "./resources/audit_logs"
require "./resources/comments"
require "./resources/presentations"
require "./resources/projects"
require "./resources/review_links"
require "./resources/teams"
require "./resources/users"
require "mintest/autorun"

module Frameio
  class Client
    include Accounts
    include AppInstalls
    include Assets
    include AuditLogs
    include Comments
    include Presentations
    include Projects
    include ReviewLinks
    include Teams
    include Users

    API_VERSION = "v2".freeze
    include HTTParty
    base_uri "https://api.frame.io/#{API_VERSION}"
    debug_output $stdout
    format :json
    attr_reader :token
    
    def initialize(token)
      @token = token
    end
    
    def headers
      { Authorization: "Bearer #{@token.access_token}" }
    end
    
    def request(method, path, body = {})
      HTTParty.send(method, path, headers, body: body)
    end
    
    def uri_path(*paths, params: {})
      url = BASE_URL
      paths.each do |path|
        url = "#{url}/#{URI.encode(path.to_s.strip)}"
      end
      url = url + "?#{to_query_string(params)}" unless params.empty?
      url
    end
    
    private
    
    def to_query_string(query_values = {})
      uri = Addressable::URI.new
      uri.query_values = query_values
      uri.query
    end
    
    def handle_response(response) 
      response.success? ? response : handle_error(response)
    end
    
    def handle_error(response)
      raise Frameio::RequestError, response
    end
  end
end

class ClientTest < Minitest::Test
  def uri_path_can_accept_args
    client = Frameio::Client.new({ access_token: "blah" })
    assert client.uri_path("/hey") == "https://api.frame.io/v2/hey"
  end
end