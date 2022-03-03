class AddIndexToOrders < ActiveRecord::Migration[6.1]
  def change
    add_index(:orders, :buyer_id)
    add_index(:orders, :seller_id)
  end
end
