require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.create({
      first_name: 'Rami',
      last_name: 'Rizk',
      email: 'ram@gtlogic.com'
    })
  end

  test 'getting the full name' do
    assert_equal 'Rami Rizk', @user.full_name
  end

  test 'setting the full name' do
    @user.full_name = 'Teddy Zeenny'
    assert_equal 'Teddy', @user.first_name
    assert_equal 'Zeenny', @user.last_name
  end

  test 'first name validation' do
    assert @user.valid?
    @user.first_name = nil
    assert @user.invalid?
    assert_equal @user.errors[:first_name].length, 1
    assert @user.errors[:first_name].include?("can't be blank")
  end
end
