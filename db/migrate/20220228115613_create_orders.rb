class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :offered_item_id, null: false, index: true
      t.integer :desired_item_id, null: false, index: true
      t.integer :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
