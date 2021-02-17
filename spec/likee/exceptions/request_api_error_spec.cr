require "./../../spec_helper"

describe Likee::APIError do
  describe "#message" do
    it "returns a friendly message" do
      likee_response = Likee::LikeeResponse.from_json(load_fixture("api_error"))
      subject = Likee::APIError.new(likee_response)

      subject.message.should eq("Likee API code 41001: request method not support")
      subject.code.should eq(41001)
    end
  end
end
