class AddBuyerToOrders < ActiveRecord::Migration[6.1]
  def change

    add_column :orders, :buyer_id, :integer, null: false, index: true
    add_column :orders, :seller_id, :integer, null: false, index: true
    remove_column :orders, :user_id

  end
end
