require "../../spec_helper"

describe Likee::Mapping::PostList do
  describe ".from_json" do
    it "parses the PostList from the response_body" do
      subject = Likee::Mapping::PostList.from_json(mocked_post_list)

      post1 = subject.post_list[0]
      post1.post_id.should eq("9999999999999999999")
      post1.position.should eq(1)
      post1.name.should eq("Brown Fox")
      post1.description.should eq("The quick brown fox jumps over the lazy dog.")
      post1.duration.should eq("PT60S")
      post1.width.should eq("720")
      post1.height.should eq("1280")
      post1.share_url.should eq("https://likee.video/s/99999999999")
      post1.url.should eq("https://likee.com/@999999999/video/9999999999999999999")
      post1.upload_date.should eq(Time.local(2021, 1, 31, 0, 2, 50, location: Time::Location.fixed(8 * 3600)))
      post1.thumbnail_url.should eq("https://videosnap.like.video/eu_live/aaa/aaaaaa_4.jpg?wmk_sdk=1&type=8")
      post1.comment_count.should eq("999")

      post2 = subject.post_list[1]
      post2.post_id.should eq("8888888888888888888")
      post2.position.should eq(2)
      post2.name.should eq("Brown Fox")
      post2.description.should eq("The five boxing wizards jump quickly")
      post2.duration.should eq("PT60S")
      post2.width.should eq("720")
      post2.height.should eq("1280")
      post2.share_url.should eq("https://likee.video/s/88888888888")
      post2.url.should eq("https://likee.com/@999999999/video/8888888888888888888")
      post2.upload_date.should eq(Time.local(2021, 1, 31, 0, 1, 50, location: Time::Location.fixed(8 * 3600)))
      post2.thumbnail_url.should eq("https://videosnap.like.video/eu_live/bbb/bbbbbb_4.jpg?wmk_sdk=1&type=8")
      post2.comment_count.should eq("888")
    end
  end
end
