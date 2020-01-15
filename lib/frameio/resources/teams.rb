module Frameio
  module Teams
   
    def list_teams
      request(:get, "/teams")
    end

    # @param team_id [String] The Frame.io team ID
    def find_team(team_id:)
      request(:get, uri_path("/teams/#{team_id}"))
    end
       
    # @param account_id [String] The Frame.io user's account ID
    def list_teams_by_account_id(account_id:)
      request(:get, uri_path("/accounts/#{account_id}/teams"))
    end
   
    # @param team_id [String] The Frame.io team ID
    def get_team_members(team_id:)
      request(:get, uri_path("/teams/#{team_id}/members"))
    end
   
    # @param team_id [String] The Frame.io team ID
    # @param body [Object] The request body for this requst. Must include role. Can include email and user_id
    def add_team_member(team_id:, body:)
      request(:post, uri_path("/teams/#{team_id}/members"), body)
    end
  end 
end