class Category < ApplicationRecord
  has_many :products, -> { where active: true}
end
