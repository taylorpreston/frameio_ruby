require "singleton"
module Frameio
  class Configuration
    include Singleton
    attr_accessor :client_id, :client_secret
  end
end