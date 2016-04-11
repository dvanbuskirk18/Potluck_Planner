require 'test_helper'

class DietaryRestrictionsControllerTest < ActionController::TestCase
  setup do
    @dietary_restriction = dietary_restrictions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dietary_restrictions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dietary_restriction" do
    assert_difference('DietaryRestriction.count') do
      post :create, dietary_restriction: {  }
    end

    assert_redirected_to dietary_restriction_path(assigns(:dietary_restriction))
  end

  test "should show dietary_restriction" do
    get :show, id: @dietary_restriction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dietary_restriction
    assert_response :success
  end

  test "should update dietary_restriction" do
    patch :update, id: @dietary_restriction, dietary_restriction: {  }
    assert_redirected_to dietary_restriction_path(assigns(:dietary_restriction))
  end

  test "should destroy dietary_restriction" do
    assert_difference('DietaryRestriction.count', -1) do
      delete :destroy, id: @dietary_restriction
    end

    assert_redirected_to dietary_restrictions_path
  end
end
