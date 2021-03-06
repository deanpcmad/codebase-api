require 'time'
require 'uri'
require 'net/https'
require 'json'

require "codebase_api/request"
require "codebase_api/project"
require "codebase_api/project_group"
require "codebase_api/project_user"
require "codebase_api/repository"
require "codebase_api/commit"
require "codebase_api/deployment"
require "codebase_api/hook"
require "codebase_api/ticket"
require "codebase_api/wiki"
require "codebase_api/public_key"
require "codebase_api/user"
require "codebase_api/discussion"
require "codebase_api/time_session"
require "codebase_api/version"

module CodebaseApi

  class << self
    
    # API Authentication
    attr_accessor :account_user, :api_key
    
  end

  class Error < StandardError; end
  module Errors
    class ServiceUnavailable < Error; end
    class AccessDenied < Error; end
    class NotFound < Error; end
    class CommunicationError < Error; end
    class ValidationError < Error; end
  end

end