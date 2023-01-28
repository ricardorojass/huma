module Mutations
  class SignOut < BaseMutation
    argument :user_id, ID, required: true
    field :message, String, null: false

    def resolve(user_id:)
      current_user = User.find(user_id)
      current_user.tokens.delete(current_user.id)
      current_user.save!
      { message: "Sign out successfully" }
    end
  end
end
