require "json"
require "../concepts/video_collection"
require "./post"

module Likee
  module Mapping
    # The `PostList` struct defines how to parse a collection of posts returned
    # from *getUserPost* endpoint.
    struct PostList
      include JSON::Serializable

      property post_list : Array(Post)

      # TODO: Refactor.
      def normalize
        Likee::VideoCollection.new(
          videos: post_list.map { |post| post.normalize }
        )
      end
    end
  end
end
