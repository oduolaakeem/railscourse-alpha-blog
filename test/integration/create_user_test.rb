require 'test_helper'


class CreateUserTest < ActionDispatch::IntegrationTest
  
  test "signup new user successfully" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { username:"johndoe", email:"johndoe@example.com", password:"password"}
    end
    assert_template 'users/show'
    assert_match "johndoe", response.body
  end
end