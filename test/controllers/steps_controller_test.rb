require 'test_helper'

class StepsControllerTest < ActionController::TestCase
  setup do
    @step = steps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:steps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create step" do
    assert_difference('Step.count') do
      post :create, step: { guide_id: @step.guide_id, layout_type_id: @step.layout_type_id, line_number: @step.line_number, name: @step.name, timer: @step.timer }
    end

    assert_redirected_to step_path(assigns(:step))
  end

  test "should show step" do
    get :show, id: @step
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @step
    assert_response :success
  end

  test "should update step" do
    patch :update, id: @step, step: { guide_id: @step.guide_id, layout_type_id: @step.layout_type_id, line_number: @step.line_number, name: @step.name, timer: @step.timer }
    assert_redirected_to step_path(assigns(:step))
  end

  test "should destroy step" do
    assert_difference('Step.count', -1) do
      delete :destroy, id: @step
    end

    assert_redirected_to steps_path
  end
end
