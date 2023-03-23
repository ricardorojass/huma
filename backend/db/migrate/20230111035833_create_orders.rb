class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true, null: false, index: true
      t.references :coupon, foreign_key: true, null: true
      t.integer :status
      t.monetize :shipping
      t.monetize :total_amount
      t.monetize :discounted_amount

      t.timestamps
    end

    add_index :orders, [:user_id, :status]
  end
end
