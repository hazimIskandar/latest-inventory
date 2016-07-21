require 'test_helper'

class ExpenseTransactionsControllerTest < ActionController::TestCase
  setup do
    @expense_transaction = expense_transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:expense_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create expense_transaction" do
    assert_difference('ExpenseTransaction.count') do
      post :create, expense_transaction: { e_date: @expense_transaction.e_date, e_note: @expense_transaction.e_note, e_total_price: @expense_transaction.e_total_price, expense_id: @expense_transaction.expense_id }
    end

    assert_redirected_to expense_transaction_path(assigns(:expense_transaction))
  end

  test "should show expense_transaction" do
    get :show, id: @expense_transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @expense_transaction
    assert_response :success
  end

  test "should update expense_transaction" do
    patch :update, id: @expense_transaction, expense_transaction: { e_date: @expense_transaction.e_date, e_note: @expense_transaction.e_note, e_total_price: @expense_transaction.e_total_price, expense_id: @expense_transaction.expense_id }
    assert_redirected_to expense_transaction_path(assigns(:expense_transaction))
  end

  test "should destroy expense_transaction" do
    assert_difference('ExpenseTransaction.count', -1) do
      delete :destroy, id: @expense_transaction
    end

    assert_redirected_to expense_transactions_path
  end
end
