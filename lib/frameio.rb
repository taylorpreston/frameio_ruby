require "httparty"
require "addressable/uri"
require "uri"
require "frameio/auth"
require "frameio/client"
require "frameio/configuration"
module Frameio
  # class RequestError < StandardError; end
  # Call this method to modify defaults in your initializers.
  #
  # @example
  #   Frameio.configure do |config|
  #     config.client_id = "abc123"
  #     config.client_secret = "abc123"
  #   end
  #
  def self.configure
    yield(configuration) if block_given?
  end
  def self.configuration
    Configuration.instance
  end
end