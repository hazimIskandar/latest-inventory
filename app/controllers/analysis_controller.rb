class AnalysisController < ApplicationController
  def home
  end
  def sell
  	
  end
  def expense
  	@complete = Complete.find(params[:complete_id])
  	@complete_transactions = CompleteTransaction.all
  end
end
