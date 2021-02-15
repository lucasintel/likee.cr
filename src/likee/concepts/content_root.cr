require "json"

module Likee
  # The `ContentRoot` structure represents a response from the Likee API.
  struct ContentRoot
    include JSON::Serializable
    include JSON::Serializable::Unmapped

    getter code : Int32
    getter message : String?

    def success?
      code.zero?
    end
  end
end
