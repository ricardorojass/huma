class AddDeviseToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :provider, :string, null: false, default: "email"
    add_column :users, :uid, :string, null: false, default: ""
    add_column :users, :encrypted_password, :string, null: false, default: ""
    add_column :users, :allow_password_change, :boolean, default: false
    add_column :users, :remember_created_at, :datetime
    add_column :users, :unconfirmed_email, :string
    add_column :users, :image, :text
    add_column :users, :tokens, :text

    add_index :users, [:uid, :provider],     unique: true

    remove_column :users, :password_digest, :string
    remove_column :users, :last_logged_in_at, :timestamp
    remove_column :users, :confirmation_redirect_url, :text
    remove_column :users, :reset_password_redirect_url, :text
    remove_column :users, :role, :integer
  end

end
