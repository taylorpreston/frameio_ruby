module Frameio
  class AuditLogs < APIResource
    # @param frame_token [FrameioAuthToken] Auth token retrieved from Frame.io
    # @param account_id [String] Frame.io account id
    def self.list(frameio_token:, account_id:)
      request(:get, "/account/#{account_id}/audit_logs", frameio_token)
    end
  end
end