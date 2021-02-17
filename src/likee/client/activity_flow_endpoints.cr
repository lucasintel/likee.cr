module Likee
  module Client
    module ActivityFlowEndpoints
      BASE_URL         = "https://api.like-video.com"
      USER_VIDEOS      = "/likee-activity-flow-micro/videoApi/getUserVideo"
      USER_POSTS_COUNT = "/likee-activity-flow-micro/userApi/getUserPostNum"

      # Gets a collection of videos published by the given user.
      #
      # The parameters *last_post_id* (as in, offset) and *limit* may be
      # used to paginate through the user profile.
      #
      # ```
      # videos = Likee.user_videos(user_id: "111")
      # videos.count # => 30
      # ```
      def user_videos(user_id : String, last_post_id = "", limit = 30) : Array(Video)
        params = {
          "uid"        => user_id,
          "lastPostId" => last_post_id,
          "count"      => limit,
          "tabType"    => 0,
        }

        payload = post(BASE_URL, USER_VIDEOS, body: params.to_json)

        Array(Video).from_json(payload, root: "videoList")
      end

      # Gets the posts count of the given user.
      #
      # ```
      # user_info = Likee.user_posts_count(user_id: "1111")
      #
      # user_info.videos_count  # => 550
      # user_info.likes_count   # => 1_000_000
      # user_info.moments_count # => 22
      # ```
      def user_posts_count(user_id : String) : UserPostsCount?
        params = {
          "uid" => user_id,
        }

        payload = post(BASE_URL, USER_POSTS_COUNT, body: params.to_json)

        pull = JSON::PullParser.new(payload)
        pull.on_key("postInfoMap") do
          pull.on_key(user_id) { UserPostsCount.new(pull) }
        end
      end
    end
  end
end
