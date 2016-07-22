class DashboardController < ApplicationController
    before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy, :new]

  def index
  	@materials = Material.all
  	@expenses = Expense.all
  	@completes = Complete.all
  end
end
