require "./spec_helper"

LIKEE_OFFICIAL_ACCOUNT_ID = "30007"

describe "Integration" do
  it "fetches user videos from Likee API", tags: "integration" do
    WebMock.allow_net_connect = true

    collection = Likee.get_user_video(user_id: LIKEE_OFFICIAL_ACCOUNT_ID)

    collection.should be_a(Array(Likee::Video))
    collection.size.should eq(30)

    video1 = collection[0]
    video1.download_url.includes?(".mp4").should be_true
  end
end
