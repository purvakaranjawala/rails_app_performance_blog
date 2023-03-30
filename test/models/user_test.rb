require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Jivga')
  end

  test 'user should be valid' do
    assert @user.valid?
  end

  test 'username should not be blank' do
    @user.name = ''
    assert_not @user.valid?
  end

  test 'username should not exceeds 25 characters' do
    @user.name = 'a' * 26
    assert_not @user.valid?
  end
end
