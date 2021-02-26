require 'test_helper'

class UserTest < ActiveSupport::TestCase
  #сохрание пользователя в БД
  test 'test_save_db' do
    instance = User.new(email: 'test@mail.ru', password: '123456', name: 'Олег' )
    assert instance.save
    instance.delete
  end
  #Проверка на уникальный email
  test 'test_unique_email' do
    instanse1 = User.new(email: 'test@mail.ru', password: '123456', name: 'Олег')
    instanse1.save
    instance2 = User.new(email: 'test@mail.ru', password: '222222', name: 'Олег')
    instance2.validate
    assert_equal instance2.errors[:email],  ["translation missing: 
      ru.activerecord.errors.models.user.attributes.email.taken"]
  end
  #взятие пользователя из БД
  test 'test_get_db' do
    instance = User.new(email: 'test4@mail.ru', password: '123456', name: 'Олег')
    assert instance.save
    assert_equal  'Олег', User.find_by_email('test4@mail.ru').name
    id = instance.id
    assert_equal  'test4@mail.ru', User.find_by_id(id).email
  end

end
