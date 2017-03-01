require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  
  def setup
    @category = Category.create(name:"sports")
    @category2 = Category.create(name:"dogs")
    @category3 = Category.create(name:"food")
  end
  
  test "should show categories listing"do
    get categories_path
    assert_template 'categories/index'
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
    assert_select "a[href=?]", category_path(@category3), text: @category3.name
  end
end