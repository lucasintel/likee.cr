require "../spec_helper"

LIKEE_OFFICIAL_ACCOUNT_ID = "30007"

describe "Activity Flow Endpoints" do
  describe "#user_videos" do
    it "gets a collection of videos from the Likee API", tags: "integration" do
      WebMock.allow_net_connect = true

      collection = Likee.user_videos(user_id: LIKEE_OFFICIAL_ACCOUNT_ID)

      collection.should be_a(Array(Likee::Video))
      collection.size.should eq(30)

      video1 = collection[0]
      video1.download_url.includes?(".mp4").should be_true
    end
  end

  describe "#user_posts_count" do
    it "gets the posts count of the given user" do
      WebMock.allow_net_connect = true

      posts_count = Likee.user_posts_count(user_id: LIKEE_OFFICIAL_ACCOUNT_ID)
      posts_count.should_not be_nil

      if posts_count
        posts_count.likes_count.should be > 0
        posts_count.videos_count.should be > 0
        posts_count.moments_count.should be > 0
      end
    end
  end
end
