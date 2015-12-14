module CodebaseApi
  class Request

    def self.request(path, method=:get, data = {})
      req = self.new(path, method)
      req.data = data
      req.make && req.success? ? req.output : false
    end
  
    attr_reader :path, :method
    attr_accessor :data
  
    def initialize(path, method = :get)
      @path = path
      @method = method
    end
  
    def success?
      @success || false
    end
  
    def output
      @output || nil
    end

    def make
      uri = URI.parse(["https://api3.codebasehq.com", @path].join('/'))
      http_request = http_class.new(uri.request_uri)
      http_request.initialize_http_header({"User-Agent" => "CodebaseApiRubyClient/#{CodebaseApi::VERSION}"})
      http_request.initialize_http_header({"Accept" => "application/json"})
      http_request.content_type = "application/json"
      http_request.basic_auth CodebaseApi.account_user, CodebaseApi.api_key
    
      http = Net::HTTP.new(uri.host, uri.port)
    
      if uri.scheme == 'https'
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
    
      http_result = http.request(http_request, @data.to_json)
      if http_result.body == 'true'
        @output = true
      elsif http_result.body == 'false'
        @output = false
      else
        if !http_result.body.empty?
          # render the output if it's a blob
          begin
            if /\/blob\//.match(uri.request_uri).nil?
              @output = JSON.parse(http_result.body)
            else
              @output = http_result.body
            end
          rescue JSON::ParserError => e
            puts "JSON PARSER ERROR"
            puts e
          end
        else
          @output
        end
      end
      @success = case http_result
      when Net::HTTPSuccess
        true
      when Net::HTTPServiceUnavailable
        raise CodebaseApi::Errors::ServiceUnavailable
      when Net::HTTPForbidden, Net::HTTPUnauthorized
        raise CodebaseApi::Errors::AccessDenied, "Access Denied"
      when Net::HTTPNotFound
        @output = false
      when Net::HTTPBadRequest, Net::HTTPUnauthorized, Net::HTTPMethodNotAllowed
        json = JSON.parse(http_result.body)
        raise CodebaseApi::Errors::AccessDenied, "Access Denied for '#{CodebaseApi.application}'  #{json['error']}"
      else
        raise CodebaseApi::Errors::CommunicationError, http_result.body
      end

      self
    end
  
    private
  
    def http_class  
      case @method
      when :post    then Net::HTTP::Post
      when :put     then Net::HTTP::Put
      when :delete  then Net::HTTP::Delete
      else
        Net::HTTP::Get
      end
    end
  
  end
end
