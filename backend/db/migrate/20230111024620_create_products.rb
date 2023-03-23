class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, index: true, unique: true
      t.text :description
      t.text :search_keywords, index: true
      t.integer :quantity
      t.decimal :shipping_weight
      t.monetize :price
      t.boolean :active, default: true
      t.string :image, index: true

      t.timestamps
    end
  end
end
