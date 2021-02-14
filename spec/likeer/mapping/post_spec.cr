require "../../spec_helper"

describe Likee::Mapping::Post do
  describe ".from_json" do
    it "parses the PostList from the response_body" do
      subject = Likee::Mapping::Post.from_json(mocked_post)

      subject.post_id.should eq("9999999999999999999")
      subject.position.should eq(1)
      subject.name.should eq("Brown Fox")
      subject.description.should eq("The quick brown fox jumps over the lazy dog.")
      subject.duration.should eq("PT60S")
      subject.width.should eq("720")
      subject.height.should eq("1280")
      subject.share_url.should eq("https://likee.video/s/99999999999")
      subject.url.should eq("https://likee.com/@999999999/video/9999999999999999999")
      subject.upload_date.should eq(Time.local(2021, 1, 31, 0, 2, 50, location: Time::Location.fixed(8 * 3600)))
      subject.thumbnail_url.should eq("https://videosnap.like.video/eu_live/aaa/aaaaaa_4.jpg?wmk_sdk=1&type=8")
      subject.comment_count.should eq("999")
    end
  end
end
