require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:holland)
  end

  test 'should get index' do
    get users_url
    assert_response :success
  end

  test 'should get new' do
    get new_user_url
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      post users_url, params: { user: { address: '1, Street lane',
                                        name: 'Micahel Nike', phone_number: '676' } }
    end
    assert_redirected_to recipes_url
    assert_equal 'Micahel Nike', User.last.name
  end

  test 'should show user' do
    get user_url(@user)
    assert_response :success
  end

  test 'should get edit' do
    get edit_user_url(@user)
    assert_response :success
  end

  test 'should update user' do
    patch user_url(@user),
          params: { user: { address: @user.address, name: "WEAreTEsting", phone_number: @user.phone_number } }
    assert_redirected_to user_url(@user)
    assert_equal "WEAreTEsting", User.find(@user.id).name
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end
    assert_redirected_to users_url
  end
end
