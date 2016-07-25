class ProfitsController < ApplicationController
    before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy, :new]
    before_action :set_untung, only: [:show, :edit, :update, :destroy]

  def index
    @profits = Profit.all

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_untung
      @profit = Profit.find(params[:id])
    end
end
