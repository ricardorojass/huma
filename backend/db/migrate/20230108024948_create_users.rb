class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, index: true, unique: true, null: false
      t.string :password_digest
      t.string :name, null: false, default: ""
      t.timestamp :last_logged_in_at
      t.string :confirmation_token, index: true, unique: true
      t.text :confirmation_redirect_url
      t.timestamp :confirmed_at
      t.timestamp :confirmation_sent_at
      t.string :reset_password_token, index: true, unique: true
      t.text :reset_password_redirect_url
      t.timestamp :reset_password_sent_at
      t.integer :role, default: 0, null: false

      t.timestamps
    end
  end
end
