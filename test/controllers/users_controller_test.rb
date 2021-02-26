require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end
  #создание пользователя
  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { age: '18', email: 'testt@mail.ru', group: '22b',
                                        name: 'Ivan', password: 'secret', password_confirmation: 'secret',
                                         town: 'Kazan' } }
    end

  end
  #страница авторизации
  test 'should get new' do
    get signin_path
    assert_response :success
  end
  #страницы регистрации
  test 'should get signup' do
    get signup_path
    assert_response :success
  end
  #невозможность создания пользователя с неуникальным email
  test 'should not create user' do
    assert_no_difference('User.count') do
      post users_url, params: { user: { email: @user.email, password: '123456' } }
    end
  end

end
