require "./likee/*"

module Likee
  def self.get_user_post(user_id : String, last_post_id = nil, count = 30)
    client.get_user_post(
      user_id: user_id,
      last_post_id: last_post_id,
      count: count
    )
  end

  def self.client : Likee::Client
    @@client ||= Likee::Client.new
  end
end
