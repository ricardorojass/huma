class OrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.references :product, null: false, foreign_key: true, index: true
      t.references :order, null: false, foreign_key: true
      t.integer :quantity
      t.monetize :price
      t.timestamps
    end

    add_index :order_items, [:product_id, :order_id]
  end
end
