module Frameio
  class Projects < APIResource
    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param project_id [String] The requested project id
    # @param body [Object] The body of the request. An object with an email attribute.
    def self.add_collaborator(frameio_token:, project_id:, body:)
      request(:post, "#{self.resource_url(project_id)}/collaborators", frameio_token, body)
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param team_id [String] The Frame.io user's account ID
    def self.list(frameio_token:, team_id:)
      request(:get, self.resource_url_with_team_id(team_id), frameio_token)
    end
    
    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param team_id [String] The Frame.io user's account ID
    # @param body [Object] The body of the request
    def self.create(frameio_token:, team_id:, body:)
      request(:post, self.resource_url_with_team_id(team_id), frameio_token, body)
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param project_id [String] The requested project id
    def self.destory(frameio_token:, project_id:)
      request(:delete, self.resource_url(project_id), frameio_token)
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param project_id [String] The requested project id
    def self.find(frameio_token:, project_id:)
      request(:get, self.resource_url(project_id), frameio_token)
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param project_id [String] The requested project id
    # @param body [Object] The reqest body to update the project.
    def self.update(frameio_token:, project_id:, body:)
      request(:put, self.resource_url(project_id), frameio_token, body)
    end

    # @param frameio_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param project_id [String] The requested project id
    # @param query_params [Object] The query params object for request. An object containing a user_id.
    def self.user_membership(frameio_token:, project_id:, query_params: nil)
      url = !query_params ? self.resource_url(project_id) : "#{self.resource_url(project_id)}?#{to_query_string(query_params)}"
      request(:get, url, frameio_token)
    end

    def self.resource_url(id)
      "/projects/#{id}"
    end

    def self.resource_url_with_team_id(team_id)
      "/teams/#{team_id}/projects"
    end
  end 
end