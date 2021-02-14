require "../../spec_helper"

describe Likee::VideoCollection do
  describe "#last_post_id" do
    context "when video collection is not empty" do
      it "returns the last post id" do
        videos = [
          Likee::Video.new(
            id: "1",
            published_at: Time.utc,
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
            video_url: "http//likee.video/a_4.mp4"
          )
        ]

        subject = Likee::VideoCollection.new(videos: videos)

        subject.last_post_id.should eq("1")
      end
    end

    context "when video collection is empty" do
      it "returns nil" do
        subject = Likee::VideoCollection.new(videos: [] of Likee::Video)

        subject.last_post_id.should be_nil
      end
    end
  end
end
