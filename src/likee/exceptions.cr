require "http/client"
require "./concepts/likee_response"

module Likee
  # This exception is raised when the HTTP status is not between 200 and 299.
  class RequestFailedError < Exception
    delegate :status, to: :response

    getter response : HTTP::Client::Response

    def initialize(@response)
    end

    def message
      "HTTP status code #{status.code}: #{status.description}"
    end
  end

  # This exception is raised when the request is successful but the Likee API
  # returns a non-zero code.
  class APIError < Exception
    delegate :code, to: :likee_response

    getter likee_response : LikeeResponse

    def initialize(@likee_response)
    end

    def message
      "Likee API code #{likee_response.code}: #{likee_response.message}"
    end
  end
end
