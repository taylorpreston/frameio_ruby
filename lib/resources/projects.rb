module Frameio
  class Projects < APIResource
    # @param frame_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param project_id [String] The requested project id
    # @param body [Object] The body of the request. An object with an email attribute.
    def self.add_collaborator(frame_token:, project_id:, body:)
      response = request(:post, "#{self.resource_url(project_id)}/collaborators", authorize_bearer_header(frame_token), body)
    end

    # @param frame_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param team_id [String] The Frame.io user's account ID
    def self.list(frame_token:, team_id:)
      response = request(:get, self.resource_url_with_team_id(team_id), authorize_bearer_header(frame_token))
    end
    
    # @param frame_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param team_id [String] The Frame.io user's account ID
    # @param body [Object] The body of the request
    def self.create(frame_token:, team_id:, body:)
      response = request(:get, self.resource_url_with_team_id(team_id), authorize_bearer_header(frame_token), body)
    end

    # @param frame_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param project_id [String] The requested project id
    def self.destory(frame_token:, project_id:)
      response = request(:delete, self.resource_url(project_id), authorize_bearer_header(frame_token))
    end

    # @param frame_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param project_id [String] The requested project id
    def self.find(frame_token:, project_id:)
      response = request(:get, self.resource_url(project_id), authorize_bearer_header(frame_token))
    end

    # @param frame_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param project_id [String] The requested project id
    # @param body [Object] The reqest body to update the project.
    def self.update(frame_token:, project_id:, body:)
      response = request(:put, self.resource_url(project_id), authorize_bearer_header(frame_token), body)
    end

    # @param frame_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param project_id [String] The requested project id
    # @param query_params [Object] The query params object for request. An object containing a user_id.
    def self.user_membership(frame_token:, project_id:, query_params: nil)
      url = !query_params ? self.resource_url(project_id) : "#{self.resource_url(project_id)}?#{to_query_string(query_params)}"
      response = request(:get, url, authorize_bearer_header(frame_token))
    end

    def self.resource_url(id)
      "#{BASE_URL}/projects/#{id}"
    end

    def self.resource_url_with_team_id(team_id)
      "#{BASE_URL}/teams/#{team_id}/projects"
    end
  end 
end