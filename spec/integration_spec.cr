require "./spec_helper"

LIKEE_OFFICIAL_ACCOUNT_ID = "30007"

describe "Integration" do
  it "fetches user videos from Likee API", tags: "integration" do
    WebMock.allow_net_connect = true

    collection = Likee.get_user_video(uid: LIKEE_OFFICIAL_ACCOUNT_ID)

    collection.should be_a(Likee::VideoCollection)
    collection.videos.size.should eq(30)

    video1 = collection.videos.first
    video1.download_url.includes?(".mp4").should be_true
  end
end
