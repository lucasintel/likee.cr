require "../../spec_helper"

describe Likee::UserPostsCount do
  describe ".from_json" do
    it "parses the Likee response code and message" do
      payload = %[
        {
          "allLikeCount": 15788313,
          "videoNums": 1725,
          "momentNums": 1,
          "likeNums": 38
        }
      ]

      subject = Likee::UserPostsCount.from_json(payload)

      subject.likes_count.should eq(15_788_313)
      subject.videos_count.should eq(1_725)
      subject.moments_count.should eq(1)
    end
  end
end
