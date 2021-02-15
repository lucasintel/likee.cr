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
    # Returns the video id ("postId").
    getter id : String

    @[JSON::Field(key: "postTime", converter: Time::EpochConverter)]
    # Returns the video upload time ("postTime").
    getter uploaded_at : Time

    @[JSON::Field(key: "posterUid")]
    # Returns the creator id ("posterUid").
    #
    # Apparently, it is referred to as "uid" rather than "id". Must not be
    # confused with "likeeId", which refers to the creator username.
    getter creator_id : String

    @[JSON::Field(key: "likeeId")]
    # Returns the creator username ("likeeId").
    getter creator_username : String

    @[JSON::Field(key: "nickname")]
    # Returns the creator nickname ("nickname").
    getter creator_nickname : String?

    @[JSON::Field(key: "avatar")]
    # Returns the creator avatar ("avatar").
    getter creator_avatar : String?

    # Returns the video title ("title").
    getter title : String?

    @[JSON::Field(key: "msgText")]
    # Returns the video caption ("msgText"). Also known as description.
    getter caption : String?

    @[JSON::Field(key: "playCount")]
    # Returns the video play count ("playCount").
    getter play_count : UInt32 = 0_u32

    @[JSON::Field(key: "likeCount")]
    # Returns the video like count ("likeCount").
    getter like_count : UInt32 = 0_u32

    @[JSON::Field(key: "commentCount")]
    # Returns the video comment count ("commentCount").
    getter comment_count : UInt32 = 0_u32

    @[JSON::Field(key: "shareCount")]
    # Returns the video share count ("shareCount").
    getter share_count : UInt32 = 0_u32

    @[JSON::Field(key: "videoHeight")]
    # Returns the video height ("videoHeight").
    getter height : UInt16

    @[JSON::Field(key: "videoWidth")]
    # Returns the video width ("videoWidth").
    getter width : UInt16

    @[JSON::Field(key: "coverUrl")]
    # Returns the video cover url ("coverUrl"). Also known as video thumbnail.
    getter cover_url : String

    @[JSON::Field(key: "videoUrl")]
    # Returns the video url ("videoUrl").
    getter video_url : String

    @[JSON::Field(key: "shareUrl")]
    # Returns the video share url ("shareUrl").
    getter share_url : String?

    @[JSON::Field(key: "musicId")]
    # Returns the video music id ("musicId").
    getter music_id : String?

    @[JSON::Field(key: "musicName")]
    # Returns the video music name ("musicName").
    getter music_name : String?

    # Extracts the URL to the video without the watermark.
    def download_url : String
      video_url.sub(WATERMARK_SUFFIX, "")
    end
  end
end
