class RawTransactionsController < ApplicationController
  before_action :set_raw_transaction, only: [:show, :edit, :update, :destroy]
  before_action :set_material
  # GET /raw_transactions
  # GET /raw_transactions.json
  def index
    @raw_transactions = RawTransaction.all
  end

  # GET /raw_transactions/1
  # GET /raw_transactions/1.json
  def show
  end

  # GET /raw_transactions/new
  def new
  #  @material = Material.find(params[:material_id])
    @raw_transaction = RawTransaction.new
  end
  def kurang
  #  @material = Material.find(params[:material_id])
    @raw_transaction = RawTransaction.new
  end

  # GET /raw_transactions/1/edit
  def edit
    @material = Material.find(params[:material_id])
    @raw_transaction = RawTransaction.find(params[:id])
  end

  # POST /raw_transactions
  # POST /raw_transactions.json
  def create
    @raw_transaction = RawTransaction.new(raw_transaction_params)
    @raw_transaction.material_id = @material.id  
    respond_to do |format|
      if @raw_transaction.save
        format.html { redirect_to @material, notice: 'Transaksi baru brjaya dimasukkan.' }
        format.json { render :show, status: :created, location: @raw_transaction }
      else
        format.html { render :new }
        format.json { render json: @raw_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /raw_transactions/1
  # PATCH/PUT /raw_transactions/1.json
  def update
    respond_to do |format|
      if @raw_transaction.update(raw_transaction_params)
        format.html { redirect_to @material, notice: 'Raw transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @raw_transaction }
      else
        format.html { render :edit }
        format.json { render json: @raw_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raw_transactions/1
  # DELETE /raw_transactions/1.json
  def destroy
    @raw_transaction.destroy
    respond_to do |format|
      format.html { redirect_to @material, notice: 'Raw transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raw_transaction
      @raw_transaction = RawTransaction.find(params[:id])
    end

    def set_material
      @material = Material.find(params[:material_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def raw_transaction_params
      params.require(:raw_transaction).permit(:t_date, :t_type, 
        :t_quantity, :t_total_price, :t_price_unit, :t_supplier, 
        :material_id)
    end
end
