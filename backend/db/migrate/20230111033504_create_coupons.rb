class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.string :code
      t.float :discount
      t.datetime :valid_from
      t.datetime :valid_until
      t.integer :max_uses
      t.integer :uses
      t.boolean :active

      t.timestamps
    end
  end
end
