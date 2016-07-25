class RawTransaction < ActiveRecord::Base
  belongs_to :material
  has_many :profits, :dependent => :delete_all
  before_save :set_price
#  default_scope -> { order(created_at: :desc) }
	after_save :update_current_stock, :set_profit
	after_destroy :update_delete_stock
	validates_presence_of :t_quantity, :t_price_unit


	def set_price
		self.t_total_price = self.t_price_unit * self.t_quantity
	end
	def update_current_stock
		if t_type === 'tambah'
			material.update current_stock: material.current_stock + t_quantity
		elsif t_type === 'kurang'
			
			material.update current_stock: material.current_stock - t_quantity
		end


	end

	def update_delete_stock
		if t_type === 'tambah'
			material.update current_stock: material.current_stock - t_quantity
		elsif t_type === 'kurang'
			
			material.update current_stock: material.current_stock + t_quantity
		end
	end

	def set_profit
		if t_type === 'tambah'
			profits.create p_date: t_date, 
				p_profit: - t_total_price,
				r_date: t_date,
				r_profit: - t_total_price
		end
	end

end
