module Frameio
  module AppInstalls
    def list_app_installs
      request(:get, "/installations/for_me")
    end
  end
end