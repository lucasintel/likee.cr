module Likee
  class Client
    # Generic `Likee::Client` error.
    class ClientError < Exception
      def initialize(status : HTTP::Status)
        @message = "HTTP Error #{status.code} - #{status.description}"
      end

      def initialize(parsed_body : JSON::Any)
        code = parsed_body["code"].as_i
        message = parsed_body["message"].as_s

        @message = "Likee Error #{code}: #{message}"
      end
    end
  end
end
