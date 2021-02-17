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
end
