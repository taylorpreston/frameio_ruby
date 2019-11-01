module Frameio
  class Presentations < APIResource
    # @param frame_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param project_id [String] The Frame.io project id.
    def self.list_by_project(frameio_token:, project_id:)
      request(:get, "#{BASE_URL}/projects/#{project_id}/presentations", authorize_bearer_header(frameio_token))
    end

    # @param frame_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param asset_id [String] The Frame.io asset id.
    def self.list_by_asset(frameio_token:, asset_id:)
      request(:get, "#{BASE_URL}/asset/#{asset_id}/presentations", authorize_bearer_header(frameio_token))
    end

    # @param frame_token [FrameioAuthToken] Auth token retrieved from Frame.io
    def self.list(frameio_token:)
      request(:get, self.request_url, authorize_bearer_header(frameio_token))
    end

    # @param frame_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param presentation_id [String] Presentation id
    def self.find(frameio_token:, presentation_id:)
      request(:get, "#{self.request_url}/#{presentation_id}", authorize_bearer_header(frameio_token))
    end

    # @param frame_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param asset_id [String] The Frame.io asset id.
    # @param asset_id [String] The request body.
    def self.create(frameio_token:, asset_id:, body:)
      request(:get, "#{BASE_URL}/asset/#{asset_id}/presentations", authorize_bearer_header(frameio_token), body)
    end

    # @param frame_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param presentation_id [String] Presentation id
    # @param body [String] The request body
    def self.update(frameio_token:, presentation_id:, body:)
      request(:put, "#{self.request_url}/#{presentation_id}", authorize_bearer_header(frameio_token), body)
    end

    def sef.request_url
      "#{BASE_URL}/presnetations"
    end
  end
end