require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup 
    @user = User.new(username: "Example", email:"user@example.com", password_digest: "123456")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "username should be present" do
    @user.username = "    "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "    "
    assert_not @user.valid?
  end
  
  test "username should not be too long" do
    @user.username = 's' * 51
    assert_not @user.valid?
  end

  test "user's email should not be too long" do
    @user.username = 'e' * 201
    assert_not @user.valid?
  end
end
