class Profit < ActiveRecord::Base
  belongs_to :RawTransaction
  belongs_to :CompleteTransaction
  belongs_to :ExpenseTransaction
end
