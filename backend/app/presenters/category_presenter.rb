# frozen_string_literal: true

class CategoryPresenter < BasePresenter
  related_to    :products
  sort_by       :id, :name, :created_at, :updated_at
  filter_by     :id, :name, :created_at, :updated_at
  build_with    :id, :name, :created_at, :updated_at
end