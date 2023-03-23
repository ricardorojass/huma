class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.string :code, unique: true
      t.decimal :discount
      t.datetime :valid_from
      t.datetime :valid_until
      t.integer :max_uses
      t.integer :uses, default: 0
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
