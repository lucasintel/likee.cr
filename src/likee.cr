require "./likee/*"

module Likee
  # Fetch videos by *user_id*. The parameters *last_post_id* (offset) and
  # *limit* may be used to paginate through the feed.
  #
  # ```
  # require "likee"
  #
  # Likee.get_user_videos(user_id: "8", last_post_id: "100", limit: 100)
  # ```
  def self.get_user_videos(user_id : String, last_post_id = "", limit = 30)
    client.get_user_videos(
      user_id: user_id,
      last_post_id: last_post_id,
      limit: limit
    )
  end

  private def self.client : Likee::Client
    @@client ||= Likee::Client.new
  end
end
