module Frameio
  class Teams < APIResource
    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    def self.list(frameio_token:)
      request(:get, self.resource_url, authorize_bearer_header(frameio_token))
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param team_id [String] The Frame.io team ID
    def self.find(frameio_token:, team_id:)
      request(:get, "#{self.resource_url}/#{team_id}", authorize_bearer_header(frameio_token))
    end
    
    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param account_id [String] The Frame.io user's account ID
    def self.list_by_account_id(frameio_token:, account_id:)
      request(:get, "#{BASE_URL}/accounts/#{account_id}/teams", authorize_bearer_header(frameio_token))
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param team_id [String] The Frame.io team ID
    def self.get_membership(frameio_token:, team_id:)
      request(:get, "#{self.resource_url}/#{team_id}/members", authorize_bearer_header(frameio_token))
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param team_id [String] The Frame.io team ID
    # @param body [Object] The request body for this requst. Must include role. Can include email and user_id
    def self.add_member(frameio_token:, team_id:, body:)
      request(:post, "#{self.resource_url}/#{team_id}/members", authorize_bearer_header(frameio_token), body)
    end

    def self.resource_url
      "#{BASE_URL}/teams"
    end
  end 
end