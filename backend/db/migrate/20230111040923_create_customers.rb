class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :full_name
      t.string :address
      t.string :city
      t.string :department
      t.string :phone_number

      t.timestamps
    end
  end
end
