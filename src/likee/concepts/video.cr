module Likee
  # A `Video` represents a video or post returned by an API call.
  struct Video
    WATERMARK_SUFFIX = "_4"

    getter id : String
    getter published_at : Time
    getter creator_id : String?
    getter sound_id : String?
    getter title : String?
    getter description : String?
    getter play_count : UInt32?
    getter like_count : UInt32?
    getter comment_count : UInt32?
    getter share_count : UInt32?
    getter height : UInt16?
    getter width : UInt16?
    getter thumbnail_url : String?
    getter website_url : String?
    getter share_url : String?
    getter video_url : String

    def initialize(
      @id,
      @published_at,
      @creator_id,
      @sound_id,
      @title,
      @description,
      @play_count,
      @like_count,
      @comment_count,
      @share_count,
      @height,
      @width,
      @thumbnail_url,
      @website_url,
      @share_url,
      @video_url
    )
    end

    # Extracts the URL to the video without the watermark.
    def download_url : String
      video_url.sub(WATERMARK_SUFFIX, "")
    end
  end
end
