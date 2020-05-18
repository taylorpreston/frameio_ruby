require "httparty"
require "addressable/uri"
require "uri"
require "ostruct"
# require "frameio/client"

# client_id = "e0ec793d-2b70-41b9-b038-762d22b76eb8"
# client_secret = "lsqRmdegl0_d"
module Frameio
  # Call this method to modify defaults in your initializers.
  #
  # @example
  #   Frameio.configure do |config|
  #     config.client_id = "abc123"
  #     config.client_secret = "abc123"
  #     config.auth_redirect_url = "abc123"
  #     config.scope = "abc123"
  #   end
  #
  class << self
    attr_accessor :configuration
  end

  def self.welcome
    "Welcome to the Frameio ruby gem"
  end

  def self.configure
    yield(configuration)
  end
  def self.configuration
    @configuration ||= OpenStruct.new
  end
end

require "frameio/auth"
require "frameio/client"
