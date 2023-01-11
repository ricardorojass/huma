class OrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :quantity
      t.float :price
      t.timestamps
    end
  end
end
