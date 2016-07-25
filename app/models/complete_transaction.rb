class CompleteTransaction < ActiveRecord::Base
  belongs_to :complete
  has_many :profits, :dependent => :delete_all
    before_save :set_price
	after_save :update_current_stock, :set_profit
	after_destroy :update_delete_stock
	validates_presence_of :f_quantity, :f_unit_sell


	def set_price
		self.f_total_sell = self.f_unit_sell * self.f_quantity
	end
	def update_current_stock
		if f_type === 'tambah'
			complete.update current_stock: complete.current_stock + f_quantity
		elsif f_type === 'kurang'
			
			complete.update current_stock: complete.current_stock - f_quantity
		end


	end

	def update_delete_stock
		if f_type === 'tambah'
			complete.update current_stock: complete.current_stock - f_quantity
		elsif f_type === 'kurang'
			
			complete.update current_stock: complete.current_stock + f_quantity
		end
	end

	def set_profit
		if f_type === 'kurang'
			profits.create p_date: f_date, 
				p_profit:  f_total_sell,
				r_date: f_date,
				r_profit: f_total_sell
		end
	end
end
