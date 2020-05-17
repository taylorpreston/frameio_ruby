module Frameio
  module Projects
    # @param project_id [String] The requested project id
    # @param body [Object] The body of the request. An object with an email attribute.
    def add_project_collaborator(project_id:, body:)
      request(:post, uri_path("/projects/#{project_id}/collaborators"), body)
    end
   
    # @param team_id [String] The Frame.io user's account ID
    def list_projects(team_id:)
      request(:get, uri_path("/teams/#{team_id}/projects"))
    end
   
    # @param team_id [String] The Frame.io user's account ID
    # @param body [Object] The body of the request
    def create_project(team_id:, body:)
      request(:post, uri_path("/teams/#{team_id}/projects"), body)
    end

    # @param project_id [String] The requested project id
    def destory_project(project_id:)
      request(:delete, uri_path("/projects/#{project_id}"))
    end

    # @param project_id [String] The requested project id
    def find_project(project_id:)
      request(:get, uri_path("/projects/#{project_id}"))
    end

    # @param project_id [String] The requested project id
    # @param body [Object] The reqest body to update the project.
    def update_project(project_id:, body:)
      request(:put, uri_path("/projects/#{project_id}"), body)
    end

    # @param project_id [String] The requested project id
    # @param query_params [Object] The query params object for request. An object containing a user_id.
    def find_user_membership_for_project(project_id:, params: {})
      request(:get, uri_path("/projects/#{project_id}", params: params))
    end
  end 
end