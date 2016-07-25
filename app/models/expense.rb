class Expense < ActiveRecord::Base
  belongs_to :user
  has_many :expense_transactions, :dependent => :destroy
  accepts_nested_attributes_for :expense_transactions
end
