require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "comment has valid user id" do
    @comment = Comment.new()
  end

  test "comment has valid post id" do
    @comment = Comment.new()
  end

  test "comment has a body" do
    @comment = Comment.new()
  end
end
