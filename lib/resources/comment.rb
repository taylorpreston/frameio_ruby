module Frameio
  class Comment < APIResource
    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    def self.list(frameio_token:)
      request(:get, self.resource_url, authorize_bearer_header(frameio_token))
    end
    
    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param comment_id [String] The Frame.io user's account ID
    def self.list_by_comment_id(frameio_token:, comment_id:)
      request(:get, self.resource_url_with_comment_id(comment_id), authorize_bearer_header(frameio_token))
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param team_id [String] The Frame.io team ID
    # @param body [Object] The request body for this requst. Must include role. Can include email and user_id
    def self.add_member(frameio_token:, team_id:, body:)
      request(:post, self.resource_url_with_team_id(team_id), authorize_bearer_header(frameio_token), body)
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param team_id [String] The Frame.io team ID
    def self.get_membership(frameio_token:, team_id:)
      request(:get, self.resource_url_with_team_id(team_id), authorize_bearer_header(frameio_token))
    end

    def self.resource_url(comment_id)
      "#{BASE_URL}/comments/#{comment_id}"
    end 
  end 
end