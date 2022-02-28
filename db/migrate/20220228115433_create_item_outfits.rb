class CreateItemOutfits < ActiveRecord::Migration[6.1]
  def change
    create_table :item_outfits do |t|
      t.references :outfit, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
