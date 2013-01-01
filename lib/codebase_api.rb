require 'time'
require 'uri'
require 'net/https'
require 'json'

require "codebase_api/version"

module CodebaseApi

  class Error < StandardError; end
  module Errors
    class ServiceUnavailable < Error; end
    class AccessDenied < Error; end
    class NotFound < Error; end
    class CommunicationError < Error; end
    class ValidationError < Error; end
  end

end