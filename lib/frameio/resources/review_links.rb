module Frameio
  module ReviewLinks
   
    # @param project_id [String] the Frame.io project id.
    def list_review_links_by_project(project_id:)
      request(:get, uri_path("/projects/#{project_id}/review_links"))
    end

    # @param project_id [String] the Frame.io project id.
    # @param body [Object] the request body.
    def create_review_link(project_id:, body:)
      request(:post, uri_path("/projects/#{project_id}/review_links"), body)
    end

    # @param review_link_id [String] the Frame.io project id.
    # @param query_params [Object] an object that will be turned into a query string.
    def find_review_link(review_link_id:, params: {})
      request(:get, uri_path("/review_links/#{review_link_id}", params: params))
    end

    # @param review_link_id [String] the Frame.io project id.
    def find_review_link_items(review_link_id:, params: {})
      request(:get, uri_path("/review_links/#{review_link_id}/items", params: params))
    end

    # @param review_link_id [String] the Frame.io project id.
    def destroy_review_link(review_link_id:)
      request(:delete, uri_path("/review_links/#{review_link_id}"))
    end

    # @param review_link_id [String] the Frame.io project id.
    def update_review_link(review_link_id:, body:)
      request(:put, uri_path("/review_links/#{review_link_id}"), body)
    end

    # @param review_link_id [String] The Frame.io review link id.
    # @param body [Object] request body
    def add_review_link_asset(review_link_id:, body:)
      request(:post, uri_path("/review_links/#{review_link_id}/assets"), body)
    end
    
    # @param team_id [String] The Frame.io team ID
    # @param body [Object] The request body for this requst. 
    def add_member_to_review_link(team_id:, body:)
      request(:post, uri_path("/review_links"), body)
    end
  end 
end