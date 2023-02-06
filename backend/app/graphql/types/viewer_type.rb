# frozen_string_literal: true

module Types
  class ViewerType < Types::BaseObject
    graphql_name 'Viewer'

    field :user, Types::UserType, null: false
    def user
      object
    end

  end
end
