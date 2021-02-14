require "../spec_helper"

describe Likee::Utils do
  describe "#random_user_agent" do
    it "returns a random user agent" do
      result = Likee::Utils.random_user_agent

      result.includes?("Mozilla/5.0").should be_true
      result.includes?("AppleWebKit/537.36 (KHTML, like Gecko)").should be_true
      result.includes?("Chrome/").should be_true
      result.includes?("Safari/537.36").should be_true
    end
  end

  describe "#random_user_agent" do
    it "returns a random user profile url" do
      result = Likee::Utils.random_profile_url

      result.includes?("https://likee.video/user/").should be_true
    end
  end
end
