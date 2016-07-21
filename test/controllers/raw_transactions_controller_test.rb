require 'test_helper'

class RawTransactionsControllerTest < ActionController::TestCase
  setup do
    @raw_transaction = raw_transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:raw_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create raw_transaction" do
    assert_difference('RawTransaction.count') do
      post :create, raw_transaction: { material_id: @raw_transaction.material_id, t_date: @raw_transaction.t_date, t_price_unit: @raw_transaction.t_price_unit, t_quantity: @raw_transaction.t_quantity, t_supplier: @raw_transaction.t_supplier, t_total_price: @raw_transaction.t_total_price, t_type: @raw_transaction.t_type }
    end

    assert_redirected_to raw_transaction_path(assigns(:raw_transaction))
  end

  test "should show raw_transaction" do
    get :show, id: @raw_transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @raw_transaction
    assert_response :success
  end

  test "should update raw_transaction" do
    patch :update, id: @raw_transaction, raw_transaction: { material_id: @raw_transaction.material_id, t_date: @raw_transaction.t_date, t_price_unit: @raw_transaction.t_price_unit, t_quantity: @raw_transaction.t_quantity, t_supplier: @raw_transaction.t_supplier, t_total_price: @raw_transaction.t_total_price, t_type: @raw_transaction.t_type }
    assert_redirected_to raw_transaction_path(assigns(:raw_transaction))
  end

  test "should destroy raw_transaction" do
    assert_difference('RawTransaction.count', -1) do
      delete :destroy, id: @raw_transaction
    end

    assert_redirected_to raw_transactions_path
  end
end
