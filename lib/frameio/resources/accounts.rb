module Frameio
  module Accounts
   
    def list_accounts
      request(:get, "/accounts")
    end
  
    # @param account_id [String] Account Id
    def find_account(account_id:)
      request(:get, uri_path("/accounts/#{account_id}"))
    end
 
    # @param account_id [String] Account Id
    def find_account_membership(account_id:)
      request(:get, uri_path("/accounts/#{account_id}/membership"))
    end
  end 
end
