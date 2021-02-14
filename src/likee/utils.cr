module Likee
  # The `Utils` module defines multiple helpers.
  module Utils
    OPERATING_SYSTEMS = [
      "Macintosh; Intel Mac OS X 10_15_7",
      "Macintosh; Intel Mac OS X 10_15_5",
      "Macintosh; Intel Mac OS X 10_11_6",
      "Macintosh; Intel Mac OS X 10_6_6",
      "Macintosh; Intel Mac OS X 10_9_5",
      "Macintosh; Intel Mac OS X 10_10_5",
      "Macintosh; Intel Mac OS X 10_7_5",
      "Macintosh; Intel Mac OS X 10_11_3",
      "Macintosh; Intel Mac OS X 10_10_3",
      "Macintosh; Intel Mac OS X 10_6_8",
      "Macintosh; Intel Mac OS X 10_10_2",
      "Macintosh; Intel Mac OS X 10_10_3",
      "Macintosh; Intel Mac OS X 10_11_5",
      "Windows NT 10.0; Win64; x64",
      "Windows NT 10.0; WOW64",
      "Windows NT 10.0"
    ]

    # Generates a random user agent string.
    # Heavily inspired by https://github.com/drawrowfly/tiktok-scraper.
    def self.random_user_agent : String
      os = OPERATING_SYSTEMS.sample
      chrome_major = (Random.rand(0..1) * 3) + 85
      chrome_version = (Random.rand(0..1) * 190) + 4100
      chrome_patch = (Random.rand(0..1) * 50) + 140

      "Mozilla/5.0 (#{os}) AppleWebKit/537.36 (KHTML, like Gecko) " \
        "Chrome/#{chrome_major}.0.#{chrome_version}.#{chrome_patch} " \
        "Safari/537.36"
    end

    # Generates a random user profile url.
    def self.random_profile_url : String
      user_id = Random.rand(400000000..500000000)

      "https://likee.video/user/@#{user_id}"
    end
  end
end
