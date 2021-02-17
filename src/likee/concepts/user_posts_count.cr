require "json"

module Likee
  struct UserPostsCount
    include JSON::Serializable
    include JSON::Serializable::Unmapped

    @[JSON::Field(key: "allLikeCount")]
    getter likes_count : UInt32

    @[JSON::Field(key: "videoNums")]
    getter videos_count : UInt32

    @[JSON::Field(key: "momentNums")]
    getter moments_count : UInt32
  end
end
