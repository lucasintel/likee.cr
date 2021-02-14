require "./likee/*"

module Likee
  # Fetch videos by *uid*. The parameters *last_post_id* and *count*
  # may be used to paginate.
  #
  # ```
  # require "likee"
  #
  # Likee.get_user_video(uid: "101", last_post_id: "100", count: 100)
  # ```
  def self.get_user_video(uid : String, last_post_id : String = "", count = 30)
    client.get_user_video(
      uid: uid,
      last_post_id: last_post_id,
      count: count
    )
  end

  private def self.client : Likee::Client
    @@client ||= Likee::Client.new
  end
end
