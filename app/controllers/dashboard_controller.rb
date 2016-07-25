class DashboardController < ApplicationController
    before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy, :new]

  def index
  	@materials = current_user.materials.all
  	@expenses = current_user.expenses.all
  	@completes = current_user.completes.all
  end
end
