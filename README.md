# Likee

[![Built with Crystal 0.36.1](https://img.shields.io/badge/Crystal-0.36.1-%23333333)](https://crystal-lang.org/)
[![GitHub release](https://img.shields.io/github/release/kandayo/likee.cr.svg?label=Release)](https://github.com/kandayo/likee.cr/releases)
[![Unit Tests](https://github.com/kandayo/likee.cr/workflows/Unit%20Tests/badge.svg)](https://github.com/kandayo/likee.cr/actions)
[![GitHub release](https://img.shields.io/github/release/kandayo/likee.cr.svg?label=Release)](https://github.com/kandayo/likee.cr/releases)

Unofficial Likee API wrapper for Crystal.

The integration tests are scheduled to run twice a day, through Github Actions.

See also: [**Likee Scraper**](https://github.com/kandayo/likee-scraper).

## Index

- [Disclaimer](#disclaimer)
- [Installation](#installation)
- [Usage](#usage)
  - [Get user videos](#get-user-videos)
  - [Get user posts count](#get-user-posts-count)
- [Contributing](#contributing)
- [Contributors](#contributors)

## Disclaimer

This lib is in no way affiliated with, authorized, maintained or endorsed by
Likee or any of its affiliates or subsidiaries.

This is purely an educational proof of concept.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
    likee:
      github: kandayo/likee.cr
   ```

2. Run `shards install`

## Usage

For more examples, please refer to the [**documentation**](https://absolab.xyz/likee.cr).

```crystal
require "likee"
```

### Get user videos

Gets a collection of videos published by the given user.

The parameters **last_post_id** (as in, offset) and **limit** may be used to
paginate through the user profile.

```crystal
videos = Likee.user_videos(user_id: "111")
videos.count # => 30
```

### Get user posts count

Gets the posts count of the given user.

```crystal
user_info = Likee.user_posts_count(user_id: "1111")

user_info.videos_count  # => 550
user_info.likes_count   # => 1_000_000
user_info.moments_count # => 22
```

## Contributing

1. Fork it (<https://github.com/kandayo/likee.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [kandayo](https://github.com/kandayo) - creator and maintainer
