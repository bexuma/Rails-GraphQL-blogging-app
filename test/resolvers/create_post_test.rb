require 'test_helper'

class Resolvers::CreatePostTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::CreatePost.new.call(nil, args, {})
  end

  test 'creating new post' do
    post = perform(
      title: 'title',
      content: 'content',
    )

    assert post.persisted?
    assert_equal post.title, 'title'
    assert_equal post.content, 'content'
  end
end