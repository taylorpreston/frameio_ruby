module Frameio
  module Comments

   # @param comment_id [String] The Frame.io project asset folder id
    def list_comment_replies(comment_id:)
      request(:get, uri_path("/comments/#{comment_id}/replies"))
    end

   # @param asset_id [String] The Frame.io project asset folder id
    def list_comments(asset_id:)
      request(:get, uri_path("/assets/#{asset_id}/comments"))
    end
    
    # @param comment_id [String] The Frame.io user's account ID
    def find_comment(comment_id:)
      request(:get, uri_path("/comments/#{comment_id}"))
    end

    # @param comment_id [String] The Frame.io user's account ID
    # @param body [Object] The request body
    def create_comment_reply(comment_id:, body:)
      request(:post, uri_path("/comments/#{comment_id}/replies"), body)
    end

    # @param comment_id [String] The Frame.io user's account ID
    # @param body [Object] The request body
    def create_comment(asset_id:, body:)
      request(:post, uri_path("/assets/#{asset_id}/comments"), body)
    end

    # @param comment_id [String] The Frame.io user's account ID
    def update_comment(comment_id:, body:)
      request(:put, uri_path("/comments/#{comment_id}"), body)
    end

    # @param comment_id [String] The Frame.io user's account ID
    def destroy_comment(comment_id:)
      request(:delete, uri_path("/comments/#{comment_id}"))
    end
  end 
end