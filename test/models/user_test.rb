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

  test "email validation should only accept valid addresses to avoid complications" do
    valid_addresses = %w[user@example.com USER@foo.COM U_S-ER@foo.bar.org first.last@foo.jp user+foo@baz.uk]
    valid_addresses.each do |item|
      @user.email = item
      assert @user.valid?
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
      foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |email|
      @user.email = email
      assert_not @user.valid?
    end
  end

end
