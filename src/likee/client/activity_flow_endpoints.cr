module Likee
  module Client
    module ActivityFlowEndpoints
      BASE_URL    = "https://api.like-video.com"
      USER_VIDEOS = "/likee-activity-flow-micro/videoApi/getUserVideo"

      # Gets a collection of videos published by the given user.
      #
      # The parameters *last_post_id* (as in, offset) and *limit* may be
      # used to paginate through the user profile.
      #
      # ```
      # videos = Likee.user_videos(user_id: "1111")
      # p videos # => [#<Likee::Video{10}>, ...]
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
    end
  end
end
