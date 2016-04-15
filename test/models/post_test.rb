require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "posts need a user_id" do
    @post = Post.new(title: "awesome cats",
                     content: "google.com")
    assert @post.valid?, "saved without a user_id"
  end

  test "posts have a valid user_id" do
    post = posts(:google)
    assert_equal post.user, users(:brit)
  end

  test "posts need a title and content" do
    @post = users(:brit).posts.new(title: "awesome cats")
    refute @post.valid?
    @post = users(:brit).posts.new(content: "google.com")
    refute @post.valid?
    @post.title = "awesome cats"
    assert @post.valid?
  end

  test "posts have many comments" do
    post = posts(:google)
    assert post.comments.count >= 0
    assert_equal post.comments.first, comments(:my_comment)
  end
end
