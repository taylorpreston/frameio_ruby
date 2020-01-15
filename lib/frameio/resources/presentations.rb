module Frameio
  class Presentations < Resource
    
    # @param project_id [String] The Frame.io project id.
    def list_presnetations_by_project(project_id:)
      request(:get, uri_path("/projects/#{project_id}/presentations"))
    end

    # @param asset_id [String] The Frame.io asset id.
    def list_presentations_by_asset(asset_id:)
      request(:get, uri_path("/asset/#{asset_id}/presentations"))
    end

    def list_presentations
      request(:get, uri_path("/presentations"))
    end
    
    # @param presentation_id [String] Presentation id
    def find_presentation(presentation_id:)
      request(:get, uri_path("/presentations/#{presentation_id}"))
    end
    
    # @param asset_id [String] The Frame.io asset id.
    # @param asset_id [String] The request body.
    def create_presentation(asset_id:, body:)
      request(:get, uri_path("/asset/#{asset_id}/presentations"), body)
    end
    
    # @param presentation_id [String] Presentation id
    # @param body [String] The request body
    def update_presesntation(presentation_id:, body:)
      request(:put, uri_path("/presentations/#{presentation_id}"), body)
    end
  end
end