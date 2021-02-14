[![Build Status](https://travis-ci.com/kandayo/likee.cr.svg?branch=main)](https://travis-ci.com/kandayo/likee.cr)

# Likee.cr

Unofficial Likee API wrapper for Crystal.

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

For more examples, please refer to the documentation.

```crystal
require "likee"

Likee.get_user_post(user_id: "XXXXX")
```

## Endpoints

- getUserVideo
- getUserPost

## Contributing

1. Fork it (<https://github.com/kandayo/likee.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [kandayo](https://github.com/kandayo) - creator and maintainer
