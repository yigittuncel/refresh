class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :brand
      t.string :size
      t.string :color
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
