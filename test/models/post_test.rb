require 'test_helper'

class PostTest < ActiveSupport::TestCase
  #сохрание поста в БД
  test 'test_save_db' do
    instance = Post.new(title: 'title1', body: 'asase', author_id: '1' )
    assert instance.save
    instance.delete
  end
  #взятие поста из БД
  test 'test_get_db' do
    instance = Post.new(title: 'title1', body: 'asase', author_id: '1' )
    assert instance.save
    assert_equal  'title1', Post.find_by_id(instance.id).title
    id = instance.id
    assert_equal  'asase', Post.find_by_id(id).body
  end

end
