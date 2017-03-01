require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  def setup
    @category = Category.new(name: "fitness")
  end
  
  test "Category should be valid" do
    assert @category.valid?
  end
  
  test "name should be present" do
    @category.name = " "
    assert_not @category.valid?
  end
  
  test "name should be unique" do
    @category.save
    category2 = Category.new(name: "fitness")
    assert_not category2.valid?
  end
  
  test "name should not be too long" do
    @category.name = "a" * 60
    assert_not @category.valid?
  end
  
  test "name should not be too short" do
    @category.name = "A"
    assert_not @category.valid?
  end
end