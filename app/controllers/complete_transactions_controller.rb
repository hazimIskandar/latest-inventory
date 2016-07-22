class CompleteTransactionsController < ApplicationController
  before_action :set_complete_transaction, only: [:show, :edit, :update, :destroy]
  before_action :set_complete
  # GET /complete_transactions
  # GET /complete_transactions.json
  def index
    @complete_transactions = CompleteTransaction.all
  end

  # GET /complete_transactions/1
  # GET /complete_transactions/1.json
  def show
  end

  # GET /complete_transactions/new
  def new
    @complete_transaction = CompleteTransaction.new
  end

  def kurang
    @complete_transaction = CompleteTransaction.new
  end

  # GET /complete_transactions/1/edit
  def edit
  end

  # POST /complete_transactions
  # POST /complete_transactions.json
  def create
    @complete_transaction = CompleteTransaction.new(complete_transaction_params)
    @complete_transaction.complete_id = @complete.id
    respond_to do |format|
      if @complete_transaction.save
        format.html { redirect_to @complete, notice: 'Complete transaction was successfully created.' }
        format.json { render :show, status: :created, location: @complete_transaction }
      else
        format.html { render :new }
        format.json { render json: @complete_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /complete_transactions/1
  # PATCH/PUT /complete_transactions/1.json
  def update
    respond_to do |format|
      if @complete_transaction.update(complete_transaction_params)
        format.html { redirect_to @complete_transaction, notice: 'Complete transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @complete_transaction }
      else
        format.html { render :edit }
        format.json { render json: @complete_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /complete_transactions/1
  # DELETE /complete_transactions/1.json
  def destroy
    @complete_transaction.destroy
    respond_to do |format|
      format.html { redirect_to @complete, notice: 'Complete transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complete_transaction
      @complete_transaction = CompleteTransaction.find(params[:id])
    end

    def set_complete
      @complete = Complete.find(params[:complete_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def complete_transaction_params
      params.require(:complete_transaction).permit(:f_date, 
        :f_type, :f_quantity, :f_total_sell, :f_unit_sell, 
        :f_buyer, :complete_id)
    end
end
