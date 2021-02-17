require "json"

module Likee
  # The `Video` structure represents a Likee video.
  #
  # The JSON payload returned by the API call is parsed and transformed to a
  # stable interface.
  struct Video
    include JSON::Serializable
    include JSON::Serializable::Unmapped

    private WATERMARK_SUFFIX = "_4"

    @[JSON::Field(key: "postId")]
    # Returns the video id.
    getter id : String

    @[JSON::Field(key: "postTime", converter: Time::EpochConverter)]
    # Returns the video upload time.
    getter uploaded_at : Time

    @[JSON::Field(key: "posterUid")]
    # Returns the creator id.
    #
    # Apparently, it is referred to as *uid* rather than *id*. Must not be
    # confused with *likeeId*, which refers to the creator username.
    getter creator_id : String

    @[JSON::Field(key: "likeeId")]
    # Returns the creator username.
    getter creator_username : String

    @[JSON::Field(key: "nickname")]
    # Returns the creator nickname.
    getter creator_nickname : String?

    @[JSON::Field(key: "avatar")]
    # Returns the creator avatar.
    getter creator_avatar : String?

    # Returns the video title.
    getter title : String?

    @[JSON::Field(key: "msgText")]
    # Returns the video caption, also known as the video description.
    getter caption : String?

    @[JSON::Field(key: "playCount")]
    # Returns the video play count.
    getter play_count : UInt32 = 0_u32

    @[JSON::Field(key: "likeCount")]
    # Returns the video like count.
    getter like_count : UInt32 = 0_u32

    @[JSON::Field(key: "commentCount")]
    # Returns the video comment count.
    getter comment_count : UInt32 = 0_u32

    @[JSON::Field(key: "shareCount")]
    # Returns the video share count.
    getter share_count : UInt32 = 0_u32

    @[JSON::Field(key: "videoHeight")]
    # Returns the video height.
    getter height : UInt16

    @[JSON::Field(key: "videoWidth")]
    # Returns the video width.
    getter width : UInt16

    @[JSON::Field(key: "coverUrl")]
    # Returns the video cover url, also known as the video thumbnail.
    getter cover_url : String

    @[JSON::Field(key: "videoUrl")]
    # Returns the video url.
    getter video_url : String

    @[JSON::Field(key: "shareUrl")]
    # Returns the video share url.
    getter share_url : String?

    @[JSON::Field(key: "musicId")]
    # Returns the video music id.
    getter music_id : String?

    @[JSON::Field(key: "musicName")]
    # Returns the video music name.
    getter music_name : String?

    # Extracts the URL to the video without the watermark.
    def download_url : String
      video_url.sub(WATERMARK_SUFFIX, "")
    end
  end
end
