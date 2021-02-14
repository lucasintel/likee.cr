require "spec"
require "webmock"

require "../src/likee"

# Clears all Webmock stubs and sets `Webmock.allow_net_connect` to false.
Spec.before_each &->WebMock.reset

def mocked_post : String
  File.read("#{mocks_path}/post.json")
end

def mocked_post_list : String
  File.read("#{mocks_path}/post_list.json")
end

def mocks_path : String
  File.expand_path("../mocks", __FILE__)
end
