# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String
    field :password_digest, String
    field :name, String
    field :last_logged_in_at, GraphQL::Types::ISO8601DateTime
    field :confirmation_token, String
    field :confirmation_redirect_url, String
    field :confirmed_at, GraphQL::Types::ISO8601DateTime
    field :confirmation_sent_at, GraphQL::Types::ISO8601DateTime
    field :reset_password_token, String
    field :reset_password_redirect_url, String
    field :reset_password_sent_at, GraphQL::Types::ISO8601DateTime
    field :role, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :users_count, Integer, null: true

    def users_count
      object.users.size
    end
  end
end
