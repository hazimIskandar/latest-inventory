class Complete < ActiveRecord::Base
  belongs_to :user
  has_many :complete_transactions, :dependent => :delete_all
  accepts_nested_attributes_for :complete_transactions
end
