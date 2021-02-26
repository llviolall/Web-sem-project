require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    visit users_url
    click_on "New User"

    fill_in "Почта", with: @user.email
    fill_in "Пароль", with: 'secret'
    fill_in "Подтверждение пароля", with: 'secret'
    fill_in "Имя", with: @user.name
    fill_in "Возраст", with: @user.age
    fill_in "Город", with: @user.town
    fill_in "Любимое блюдо", with: @user.group
    
    click_on "Добавить"
    "I wait 10 second"
    assert_text "User was successfully created."
    click_on "Назад"
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first

    fill_in "Возраст", with: @user.age
    fill_in "Почта", with: @user.email
    fill_in "Любимое блюдо", with: @user.group
    fill_in "Имя", with: @user.name
    # fill_in "Пароль", with: 'secret'
    # fill_in "Подтверждение пароля", with: 'secret'
    fill_in "Город", with: @user.town
    click_on "Сохранить"
    "I wait 10 second"
    assert_text "User was successfully updated."
    click_on "Назад"
  end

  test "destroying a User" do
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed."
  end
end
