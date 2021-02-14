require "json"
require "../concepts/video"

module Likee
  module Mapping
    # The `Post` struct defines how to parse a post returned from *getUserPost*
    # endpoint.
    struct Post
      include JSON::Serializable

      property post_id : String
      property position : UInt32
      property name : String?
      property description : String?
      property duration : String
      property width : String
      property height : String
      property share_url : String
      property url : String

      @[JSON::Field(key: "uploadDate", converter: Time::Format.new("%Y-%m-%dT%T%:z"))]
      property upload_date : Time

      @[JSON::Field(key: "thumbnailUrl")]
      property thumbnail_url : String

      @[JSON::Field(key: "contentUrl")]
      property content_url : String

      @[JSON::Field(key: "commentCount")]
      property comment_count : String

      # TODO: Refactor.
      def normalize
        Likee::Video.new(
          id: post_id,
          published_at: upload_date,
          creator_id: nil,
          sound_id: nil,
          title: name,
          description: description,
          play_count: nil,
          like_count: nil,
          comment_count: nil,
          share_count: nil,
          height: nil,
          width: nil,
          thumbnail_url: thumbnail_url,
          website_url: url,
          share_url: share_url,
          video_url: content_url
        )
      end
    end
  end
end
