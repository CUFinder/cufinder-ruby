module Cufinder
  class Error < StandardError; end
  
  class AuthenticationError < Error; end
  class RateLimitError < Error; end
  class CreditLimitError < Error; end
  class ApiError < Error
    attr_reader :status, :message
    
    def initialize(status, message)
      @status = status
      @message = message
      super("API Error #{status}: #{message}")
    end
  end
  
  class HttpError < Error; end
  class ValidationError < Error; end
end
