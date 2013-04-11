require 'test_helper'

class PropertyControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get property" do
    get :property
    assert_response :success
  end

end
