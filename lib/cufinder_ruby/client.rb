require "httparty"
require "json"
require "cufinder_ruby/errors"

module CufinderRuby
  class Client
    include HTTParty
    
    attr_reader :api_key, :base_url, :timeout, :max_retries
    
    def initialize(api_key:, base_url: "https://api.cufinder.io/v2", timeout: 30, max_retries: 3)
      @api_key = api_key
      @base_url = base_url
      @timeout = timeout
      @max_retries = max_retries
      
      self.class.base_uri base_url
      self.class.headers "User-Agent" => "cufinder-ruby/#{CufinderRuby::VERSION}"
    end
    
    def post(endpoint, data)
      response = self.class.post(
        endpoint,
        body: form_encode(data),
        headers: {
          "x-api-key" => api_key,
          "Content-Type" => "application/x-www-form-urlencoded"
        },
        timeout: @timeout
      )
      
      handle_response(response)
    end
    
    private
    
    def form_encode(data)
      return "" if data.nil? || data.empty?
      
      data.map do |key, value|
        next if value.nil?
        
        if value.is_a?(Array)
          value.map { |v| "#{key}=#{CGI.escape(v.to_s)}" }.join("&")
        else
          "#{key}=#{CGI.escape(value.to_s)}"
        end
      end.compact.join("&")
    end
    
    def handle_response(response)
      case response.code
      when 200..299
        extract_data(response.parsed_response)
      when 401
        raise AuthenticationError, response.body
      when 402
        raise CreditLimitError, response.body
      when 429
        raise RateLimitError, response.body
      else
        raise ApiError.new(response.code, response.body)
      end
    rescue JSON::ParserError => e
      raise HttpError, "Failed to parse response: #{e.message}"
    rescue HTTParty::Error => e
      raise HttpError, "HTTP request failed: #{e.message}"
    end
    
    def extract_data(response_data)
      # Extract data from wrapper if present (similar to Go SDK's mapToStruct)
      if response_data.is_a?(Hash) && response_data.key?("data")
        data = response_data["data"]
        # Add meta_data if it exists in the outer response
        if response_data.key?("meta_data")
          data["meta_data"] = response_data["meta_data"]
        end
        data
      else
        response_data
      end
    end
  end
end
