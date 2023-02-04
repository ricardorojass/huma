module Mutations
  class CreateUser < BaseMutation
    description 'Attributes to create a user.'

    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    def resolve(name:, email:, password:)
      user = User.new(
        name: name,
        email: email,
        password_digest: password,
      )

      if user.save
        context[:current_user] = user
        {
          user: user,
          errors: []
        }
      else
        {
          user: nil,
          errors: user.errors.full_messages
        }
      end
    end
  end
end
