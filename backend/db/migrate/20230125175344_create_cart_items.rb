class CreateCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_items do |t|
      t.references :product, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: true
      t.integer :quantity, default: 1, null: false

      t.timestamps
    end
  end
end
