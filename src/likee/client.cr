require "http/client"

require "./concepts/*"
require "./exceptions"
require "./utils"

module Likee
  class Client
    BASE_URL            = "https://api.like-video.com"
    GET_USER_VIDEO_PATH = "/likee-activity-flow-micro/videoApi/getUserVideo"

    def initialize(@client : HTTP::Client = build_client)
    end

    def get_user_video(user_id : String, last_post_id = "", limit = 30)
      params = {
        "uid"        => user_id,
        "lastPostId" => last_post_id,
        "count"      => limit,
        "tabType"    => 0,
      }

      response = @client.post(GET_USER_VIDEO_PATH, body: params.to_json)
      response_body = parse_response!(response)

      Array(Video).from_json(response_body, root: "videoList")
    end

    private def parse_response!(response : HTTP::Client::Response) : String
      raise RequestFailedError.new(response) unless response.success?

      likee_response = LikeeResponse.from_json(response.body)
      raise APIError.new(likee_response) unless likee_response.success?

      likee_response.json_unmapped["data"].to_json
    end

    private def build_client : HTTP::Client
      uri = URI.parse(BASE_URL)
      client = HTTP::Client.new(uri)

      client.before_request do |request|
        request.headers["User-Agent"] = Utils.random_user_agent
        request.headers["Referer"] = "https://likee.video/"
        request.headers["Origin"] = "https://likee.video"
        request.headers["Content-Type"] = "application/json"
        request.headers["Accept"] = "application/json"
      end

      client
    end
  end
end
