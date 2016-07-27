class ExpenseTransaction < ActiveRecord::Base
  belongs_to :expense
  has_many :profits, :dependent => :delete_all
  after_save :set_profit
  validates_presence_of :e_total_price


  def set_profit
		if e_type === 'tambah'
			profits.create p_date: e_date, 
				p_profit: - e_total_price
		end
	end

end
