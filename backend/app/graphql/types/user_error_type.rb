# frozen_string_literal: true

module Types
  class UserErrorType < Types::BaseObject
    field :message, String, null: false
    field :path, String, null: false
  end
end
