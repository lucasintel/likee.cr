require "spec"
require "webmock"

require "../src/likee"

def mocked_post : String
  File.read("#{mocks_path}/post.json")
end

def mocked_post_list : String
  File.read("#{mocks_path}/post_list.json")
end

def mocks_path : String
  File.expand_path("../mocks", __FILE__)
end
