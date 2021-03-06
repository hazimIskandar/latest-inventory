class Complete < ActiveRecord::Base
  belongs_to :user
  has_many :complete_transactions, :dependent => :destroy
  accepts_nested_attributes_for :complete_transactions
  validates_presence_of :minimum_stock
end
