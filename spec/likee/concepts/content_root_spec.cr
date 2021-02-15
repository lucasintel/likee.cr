require "../../spec_helper"

describe Likee::ContentRoot do
  describe ".from_json" do
    it "parses the Likee response code and message" do
      content_root = Likee::ContentRoot.from_json(mocked_post_list)

      content_root.code.should eq(0)
      content_root.message.should eq("ok")
    end
  end
end
