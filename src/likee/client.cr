require "http/client"

require "./client/*"
require "./concepts/*"
require "./exceptions"
require "./utils"

module Likee
  module Client
    include ActivityFlowEndpoints

    {% for verb in %i[get post] %}
      private def {{verb.id}}(base_url : String, path : String, body : String)
        conn = build_connection(base_url)
        response = conn.{{verb.id}}(path, body: body)

        parse_response!(response)
      end
    {% end %}

    private def parse_response!(response : HTTP::Client::Response) : String
      raise RequestFailedError.new(response) unless response.success?

      likee_response = LikeeResponse.from_json(response.body)
      raise APIError.new(likee_response) unless likee_response.success?

      likee_response
        .json_unmapped["data"]
        .to_json
    end

    private def build_connection(base_url : String) : HTTP::Client
      conn = HTTP::Client.new(URI.parse(base_url), tls: true)

      conn.connect_timeout = 2
      conn.write_timeout = 2
      conn.read_timeout = 5

      conn.before_request do |request|
        request.headers.merge!(default_headers)
      end

      conn
    end

    private def default_headers : HTTP::Headers
      HTTP::Headers{
        "Accept"       => "application/json",
        "Content-Type" => "application/json",
        "Origin"       => "https://likee.video",
        "Referer"      => "https://likee.video/",
        "User-Agent"   => Utils.random_user_agent,
      }
    end
  end
end
