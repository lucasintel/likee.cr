require "./video"

module Likee
  # A `VideoCollection` represents a collection of videos returned by an API
  # call. The array of `Video` can be accessed with `#videos`.
  struct VideoCollection
    getter videos : Array(Video)

    def initialize(@videos)
    end

    # Returns the last video id, useful to paginate the user feed.
    def last_post_id : String?
      return if @videos.none?

      @videos.last.id
    end
  end
end
