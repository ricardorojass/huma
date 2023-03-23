class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :order, null: false, foreign_key: true, index: true
      t.string :payment_method
      t.monetize :amount
      t.string :idempotency_key
      t.integer :status, default: 0
      t.string :charge_id
      t.text :error

      t.timestamps
    end
  end
end
