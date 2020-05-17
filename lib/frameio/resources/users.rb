module Frameio
  module Users
    def find_me
      request(:get, "/me")
    end
  end
end