class CreateCompletes < ActiveRecord::Migration
  def change
    create_table :completes do |t|
      t.string :name
      t.string :unit
      t.integer :minimum_stock
      t.integer :current_stock
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
