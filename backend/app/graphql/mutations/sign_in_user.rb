module Mutations
  class SignInUser < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :token, String, null: true
    field :viewer, Types::ViewerType, null: true
    field :errors, [Types::UserErrorType], null: false

    def resolve(email:, password:)
      user = authenticate_user(email, password)
      unless user
        return {
          errors: [UserError.new('email o contraseña incorrectos')]
        }
      end

      token = user.create_new_auth_token.to_json

      {
        viewer: user,
        token: token,
        errors: []
      }
    end

    def authenticate_user(email, password)
      return if email.blank? || password.blank?

      user = User.find_by(email: email)
      return unless user
      return unless user&.valid_password?(password)

      user
    end
  end
end