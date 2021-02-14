require "json"
require "./video"

module Likee
  # The `VideoCollection` entity represents a collection of `Video`.
  #
  # The JSON payload returned by the API call is parsed and transformed to a
  # stable interface.
  struct VideoCollection
    include JSON::Serializable
    include JSON::Serializable::Unmapped

    @[JSON::Field(key: "videoList")]
    getter videos : Array(Video)

    # Returns the last video id, useful to paginate the user feed.
    def last_post_id : String?
      return if videos.none?

      videos.last.id
    end
  end
end
