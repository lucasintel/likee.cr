require "http/client"

require "./concepts/*"
require "./client/*"
require "./utils"

module Likee
  class Client
    BASE_URL = "https://api.like-video.com"
    GET_USER_VIDEO_PATH = "/likee-activity-flow-micro/videoApi/getUserVideo"

    def initialize(@client : HTTP::Client = build_client)
    end

    def get_user_video(uid : String, last_post_id : String = "", count = 30)
      response_body = request(
        GET_USER_VIDEO_PATH,
        { uid: uid, lastPostId: last_post_id, count: count, tabType: 0 }.to_json
      )

      Likee::VideoCollection.from_json(response_body, root: "data")
    end

    private def request(endpoint : String, params : String) : String
      response = @client.post(endpoint, body: params)
      raise ClientError.new(response.status) unless response.success?

      parsed_body = JSON.parse(response.body)
      code = parsed_body["code"].as_i
      raise ClientError.new(parsed_body) unless code.zero?

      response.body
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
