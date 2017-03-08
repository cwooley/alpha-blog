require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  
  def setup
    @user = User.create(username:"TestUser", email:"testuser@gmail.com", password:"test", admin: true)
    @category = Category.create(name:"Dogs")
  end
  test "should get categories index" do
    get :index
    assert_response :success
  end
  
  test "should get new" do
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end
  
  test "should get show" do
    get(:show, {'id' => @category.id})
    assert_response :success
  end

  test "should redirect create when not admin" do
    assert_no_difference 'Category.count' do
      post :create, category:{ name: "Bouviers" }
    end
    assert_redirected_to categories_path
  end
end