require 'test_helper'

class CompletesControllerTest < ActionController::TestCase
  setup do
    @complete = completes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:completes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create complete" do
    assert_difference('Complete.count') do
      post :create, complete: { current_stock: @complete.current_stock, minimum_stock: @complete.minimum_stock, name: @complete.name, unit: @complete.unit, user_id: @complete.user_id }
    end

    assert_redirected_to complete_path(assigns(:complete))
  end

  test "should show complete" do
    get :show, id: @complete
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @complete
    assert_response :success
  end

  test "should update complete" do
    patch :update, id: @complete, complete: { current_stock: @complete.current_stock, minimum_stock: @complete.minimum_stock, name: @complete.name, unit: @complete.unit, user_id: @complete.user_id }
    assert_redirected_to complete_path(assigns(:complete))
  end

  test "should destroy complete" do
    assert_difference('Complete.count', -1) do
      delete :destroy, id: @complete
    end

    assert_redirected_to completes_path
  end
end
