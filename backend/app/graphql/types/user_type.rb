# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String
    field :name, String
    field :image, String, null: true
    field :role, String, null: false

    field :is_confirmed, Boolean, null: false
    def is_confirmed
      object.confirmed?
    end

    field :is_locked, Boolean, null: false
    def is_locked
      object.access_locked?
    end
  end
end
