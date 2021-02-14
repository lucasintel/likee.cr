require "http/client"
require "./utils"

module Likee
  # The `Client` that consumes the Likee API.
  class Client
    BASE_URL = "https://likee.video"

    def initialize(@client : HTTP::Client = build_client)
    end

    # Fetches the posts of *user_id*. The parameters *last_post_id* and *count*
    # may be used to paginate.
    def get_user_post(user_id : String, last_post_id = nil, count = 30)
      params = HTTP::Params.build do |url|
        url.add("currentUrl", Utils.random_profile_url)
        url.add("u", user_id)
        url.add("last_postid", last_post_id)
        url.add("count", count.to_s)
      end

      response_body = request("/live/share/getUserPost", params)

      Likee::Mapping::PostList
        .from_json(response_body)
        .normalize
    end

    private def request(endpoint : String, params : String) : String
      endpoint += "?#{params}" if params
      response = @client.get(endpoint)

      if response.status_code != 200
        raise Exception.new("Likee responded with #{response.status_code}")
      end

      response.body
    end

    private def build_client : HTTP::Client
      uri = URI.parse(BASE_URL)
      client = HTTP::Client.new(uri)

      client.before_request do |request|
        request.headers["User-Agent"] = Utils.random_user_agent
      end

      client
    end
  end
end
