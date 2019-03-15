class AddOrderToDirections < ActiveRecord::Migration[5.1]
  def change
    add_column :directions, :order, :int
  end
end
