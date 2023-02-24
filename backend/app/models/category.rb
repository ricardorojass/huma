class Category < ApplicationRecord
  has_many :products, -> { where active: true}, dependent: :delete_all

  validates :name, presence: true
  validates :description, presence: true
end
