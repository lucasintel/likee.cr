require "../../spec_helper"

describe Likee::LikeeResponse do
  describe ".from_json" do
    it "parses the Likee response code and message" do
      likee_response = Likee::LikeeResponse.from_json(mocked_post_list)

      likee_response.code.should eq(0)
      likee_response.message.should eq("ok")
      likee_response.json_unmapped.should be_a(Hash(String, JSON::Any))
    end
  end
end
