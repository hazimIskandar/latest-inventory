class Material < ActiveRecord::Base
  belongs_to :user
  has_many :raw_transactions, :dependent => :destroy
  accepts_nested_attributes_for :raw_transactions
  validates_presence_of :minimum_stock
end
