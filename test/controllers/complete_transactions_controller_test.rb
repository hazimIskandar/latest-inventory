require 'test_helper'

class CompleteTransactionsControllerTest < ActionController::TestCase
  setup do
    @complete_transaction = complete_transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:complete_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create complete_transaction" do
    assert_difference('CompleteTransaction.count') do
      post :create, complete_transaction: { complete_id: @complete_transaction.complete_id, f_buyer: @complete_transaction.f_buyer, f_date: @complete_transaction.f_date, f_quantity: @complete_transaction.f_quantity, f_total_sell: @complete_transaction.f_total_sell, f_type: @complete_transaction.f_type, f_unit_sell: @complete_transaction.f_unit_sell }
    end

    assert_redirected_to complete_transaction_path(assigns(:complete_transaction))
  end

  test "should show complete_transaction" do
    get :show, id: @complete_transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @complete_transaction
    assert_response :success
  end

  test "should update complete_transaction" do
    patch :update, id: @complete_transaction, complete_transaction: { complete_id: @complete_transaction.complete_id, f_buyer: @complete_transaction.f_buyer, f_date: @complete_transaction.f_date, f_quantity: @complete_transaction.f_quantity, f_total_sell: @complete_transaction.f_total_sell, f_type: @complete_transaction.f_type, f_unit_sell: @complete_transaction.f_unit_sell }
    assert_redirected_to complete_transaction_path(assigns(:complete_transaction))
  end

  test "should destroy complete_transaction" do
    assert_difference('CompleteTransaction.count', -1) do
      delete :destroy, id: @complete_transaction
    end

    assert_redirected_to complete_transactions_path
  end
end
