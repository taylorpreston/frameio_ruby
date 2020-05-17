module Frameio
  module AuditLogs
    # @param account_id [String] Frame.io account id
    def list_audit_logs(account_id:)
      request(:get, uri_path("/account/#{account_id}/audit_logs"))
    end
  end
end