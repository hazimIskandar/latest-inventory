class Material < ActiveRecord::Base
  belongs_to :user
  has_many :raw_transactions
  accepts_nested_attributes_for :raw_transactions
end
