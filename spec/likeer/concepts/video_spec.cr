require "../../spec_helper"

describe Likee::Video do
  describe "#download_url" do
    it "returns the download url" do
      timestamp = Time.utc

      subject = Likee::Video.new(
        id: "1",
        published_at: timestamp,
        creator_id: nil,
        sound_id: nil,
        title: nil,
        description: nil,
        play_count: nil,
        like_count: nil,
        comment_count: nil,
        share_count: nil,
        height: nil,
        width: nil,
        thumbnail_url: nil,
        website_url: nil,
        share_url: nil,
        video_url: "https://likee.video/a_4.mp4"
      )

      subject.download_url.should eq("https://likee.video/a.mp4")
    end
  end
end
