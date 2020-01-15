module Frameio
  module Assets
   
    # @param asset_id [String] The Frame.io project asset folder id
    # @param body[Object] This body of the request for adding a comment. 
    def add_comment_to_asset(asset_id:, body:)
      request(:post, uri_path("/assets/#{asset_id}/comments"), body)
    end

    # @param asset_id [String] The Frame.io project asset folder id
    def list_asset_children(asset_id:)
      request(:get, uri_path("/assets/#{asset_id}/children"))
    end

    # @param asset_id [String] The Frame.io project asset folder id
    def list_asset_comments(asset_id:)
      request(:get, uri_path("/assets/#{asset_id}/comments"))
    end

    # @param asset_id [String] The Frame.io project asset folder id
    # @param body[Object] This body of the request. Must include name and file_size in bytes. 
    def create_asset(asset_id:, body:)
      request(:post, uri_path("/assets/#{asset_id}/children"), body)
    end

    # @param asset_id [String] The Frame.io project asset folder id
    def destroy_asset(asset_id:)
      request(:delete, uri_path("/assets/#{asset_id}"))
    end

    # @param asset_id [String] The Frame.io project asset folder id
    def find_asset(asset_id:)
      request(:get, uri_path("/assets/#{asset_id}"))
    end

    # @param asset_id [String] The Frame.io project asset folder id
    def subtitles_for_asset(asset_id:)
      request(:get, uri_path("/assets/#{asset_id}/subtitles"))
    end

    # @param query_params [Object] Query parameters object that will search for an asset.
    def search(params:)
      request(:get, uri_path("/search/assets", params: params))
    end

    # @param asset_id [String] The Frame.io project asset folder id
    def audio(asset_id:)
      request(:get, uri_path("/assets/#{asset_id}/audio"))
    end


    # @param asset_id [String] The Frame.io project asset folder id
    # @param body [Object] This body of the request. Must include name and file_size in bytes. 
    def update(asset_id:, body:)
      request(:put, "/assets/#{asset_id}", body)
    end

   
    # @param asset_id [String] The Frame.io project asset folder id
    def unversion(asset_id:)
      request(:delete, "/assets/#{asset_id}/unversion")
    end

   
    # @param asset_id [String] The Frame.io project asset folder id
    def add_version(asset_id:, body:)
      request(:post, "/assets/#{asset_id}/version", authorize_bearer_header(frameio_token, body))
    end
  end 
end