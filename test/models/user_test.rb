require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "user passwords are encrypted" do
    password = "cookies"
    @user = User.new(email: "foo@bar.baz",
                     password: password)
    @user.save
    assert_not_nil @user.password_digest
    assert_not_equal password, @user.password_digest
  end

  test "user must have valid email" do
    @user = User.new(email: "stupid nonsense",
                     password: "taco lunch")
    refute @user.valid?
    @user.email = "this@is.okay"
    assert @user.valid?
  end

  test "users have many posts" do
    user = users(:brit)
    assert user.posts.count >= 0
    assert_equal user.posts.first, posts(:google)
  end

  test "users have many comments" do
    user = users(:brit)
    assert user.posts.count >= 0
    assert_equal user.comments.first, comments(:my_comment)
  end
end
