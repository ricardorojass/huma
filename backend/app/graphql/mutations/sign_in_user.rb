module Mutations
  class SignInUser < BaseMutation
    field :token, String, null: true

    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: true

    def resolve(email:, password:)
      user = User.find_by(email: email)
      if user&.valid_password?(password)
        token = user.create_new_auth_token
        { user: user, token: token }
      else
        raise GraphQL::ExecutionError, 'Invalid email or password'
      end
    end
  end
end