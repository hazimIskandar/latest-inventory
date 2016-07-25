class ExpenseTransactionsController < ApplicationController
  before_action :set_expense_transaction, only: [:show, :edit, :update, :destroy]
  before_action :set_expenses
  # GET /expense_transactions
  # GET /expense_transactions.json
  def index
    @expense_transactions = ExpenseTransaction.all
  end

  # GET /expense_transactions/1
  # GET /expense_transactions/1.json
  def show
  end

  # GET /expense_transactions/new
  def new
    @expense_transaction = ExpenseTransaction.new
  end

  # GET /expense_transactions/1/edit
  def edit
    @expense = Expense.find(params[:expense_id])
    @expense_transaction = ExpenseTransaction.find(params[:id])
  end

  # POST /expense_transactions
  # POST /expense_transactions.json
  def create
    @expense_transaction = ExpenseTransaction.new(expense_transaction_params)
    @expense_transaction.expense_id = @expense.id
    respond_to do |format|
      if @expense_transaction.save
        format.html { redirect_to @expense, notice: 'Transaksi baru berjaya dimasukkan.' }
        format.json { render :show, status: :created, location: @expense_transaction }
      else
        format.html { render :new }
        format.json { render json: @expense_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expense_transactions/1
  # PATCH/PUT /expense_transactions/1.json
  def update
    respond_to do |format|
      if @expense_transaction.update(expense_transaction_params)
        format.html { redirect_to expense_expense_transaction_path(@expense, @expense_transaction),
           notice: 'Expense transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense_transaction }
      else
        format.html { render :edit }
        format.json { render json: @expense_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expense_transactions/1
  # DELETE /expense_transactions/1.json
  def destroy
    @expense_transaction.destroy
    respond_to do |format|
      format.html { redirect_to @expense, notice: 'Expense transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense_transaction
      @expense_transaction = ExpenseTransaction.find(params[:id])
    end

    def set_expenses
      @expense = Expense.find(params[:expense_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_transaction_params
      params.require(:expense_transaction).permit(:e_date, 
        :e_total_price, :e_note, :e_type, :expense_id)
    end
end
