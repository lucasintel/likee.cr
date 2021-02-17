require "../../spec_helper"

describe Likee::LikeeResponse do
  describe ".from_json" do
    it "parses the Likee response code and message" do
      subject = Likee::LikeeResponse.from_json(load_fixture("video_collection"))

      subject.code.should eq(0)
      subject.message.should eq("ok")
      subject.json_unmapped.should be_a(Hash(String, JSON::Any))
    end
  end

  describe "#success?" do
    it "returns true when code is zero" do
      subject = Likee::LikeeResponse.from_json(load_fixture("video_collection"))

      subject.success?.should be_true
    end

    it "returns false when code is not zero" do
      subject = Likee::LikeeResponse.from_json(load_fixture("api_error"))

      subject.success?.should be_false
    end
  end
end
