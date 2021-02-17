require "json"

module Likee
  # The `LikeeResponse` structure represents a response from the Likee API.
  struct LikeeResponse
    include JSON::Serializable
    include JSON::Serializable::Unmapped

    SUCCESS_CODES = [0]

    getter code : Int32
    getter message : String?

    def success?
      SUCCESS_CODES.includes?(code)
    end
  end
end
