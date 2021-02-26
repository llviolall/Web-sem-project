require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  #Невозможность действий без регистрации
  test 'should_redirect_to_signin' do
    get posts_my_posts_path
    assert_response :redirect
    assert_redirected_to signin_url
    get posts_path
    assert_response :redirect
    assert_redirected_to signin_url
  end

  #страница авторизации
  test 'should get new' do
    get signin_url
    assert_response :success
  end

end
