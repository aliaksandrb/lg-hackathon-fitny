require 'test_helper'

class LayoutTypesControllerTest < ActionController::TestCase
  setup do
    @layout_type = layout_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:layout_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create layout_type" do
    assert_difference('LayoutType.count') do
      post :create, layout_type: { name: @layout_type.name }
    end

    assert_redirected_to layout_type_path(assigns(:layout_type))
  end

  test "should show layout_type" do
    get :show, id: @layout_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @layout_type
    assert_response :success
  end

  test "should update layout_type" do
    patch :update, id: @layout_type, layout_type: { name: @layout_type.name }
    assert_redirected_to layout_type_path(assigns(:layout_type))
  end

  test "should destroy layout_type" do
    assert_difference('LayoutType.count', -1) do
      delete :destroy, id: @layout_type
    end

    assert_redirected_to layout_types_path
  end
end
