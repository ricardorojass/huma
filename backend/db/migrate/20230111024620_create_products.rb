class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :cost_price
      t.decimal :sale_price
      t.decimal :purchase_price
      t.boolean :active

      t.timestamps
    end
  end
end
