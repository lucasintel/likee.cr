require "http/client"
require "./concepts/content_root"

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
    getter content_root : ContentRoot

    def initialize(@content_root)
    end

    def message
      "Likee API code #{content_root.code}: #{content_root.message}"
    end
  end
end
