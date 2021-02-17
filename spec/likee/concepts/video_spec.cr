require "../../spec_helper"

describe Likee::Video do
  describe ".from_json" do
    it "parses the Video from JSON" do
      video = Likee::Video.from_json(load_fixture("video"))

      video.id.should eq("6928482856398255415")
      video.uploaded_at.should eq(Time.utc(2021, 2, 12, 20, 52, 3))
      video.creator_id.should eq("30007")
      video.creator_username.should eq("Likee_USA")
      video.creator_nickname.should eq("Likee US")
      video.creator_avatar.should eq("https://img.like.video/asia_live/3s1/2Fu61w.jpg")
      video.title.should eq("")
      video.caption.should eq("Loving this Valentine's look from @Sydney Purl")
      video.play_count.should eq(43814_u32)
      video.like_count.should eq(3961_u32)
      video.comment_count.should eq(177_u32)
      video.share_count.should eq(385_u32)
      video.height.should eq(960_u16)
      video.width.should eq(540_u16)
      video.cover_url.should eq("https://videosnap.like.video/asia_live/3s1/014BdUm_4.jpg?wmk_sdk=1")
      video.video_url.should eq("http://video.like.video/asia_live/3s1/2NACi5_4.mp4?crc=1896456546&type=5")
      video.share_url.should eq("")
      video.music_id.should eq("")
      video.music_name.should eq("Likee US")
    end
  end

  describe "#download_url" do
    it "returns the download url to the video without watermark" do
      subject = Likee::Video.from_json(load_fixture("video"))

      subject.download_url.should eq("http://video.like.video/asia_live/3s1/2NACi5.mp4?crc=1896456546&type=5")
    end
  end
end
