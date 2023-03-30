require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  test 'can see the user index' do
    get '/users'
    assert_select 'h1', 'Users'
  end

  test 'can see the user new page form' do
    get '/users/new'
    assert_select 'h1', 'New user'
    assert_response :success
    post '/users',
      params: { user: { name: 'Hope', phone_number: 123_456_789, address: '56, Texas County' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select 'h1', "Recipes"
  end
end
