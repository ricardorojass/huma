Rails.application.routes.draw do
  # GraphQL API
  # post "/graphql", to: "graphql#execute"

  # if Rails.env.development?
  #   mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "graphql#execute"
  # end
  scope :api do
    resources :products
    resources :categories
    resources :cart_items
    resources :users, except: :put

    resources :user_confirmations, only: :show, param: :confirmation_token
    resources :password_resets, only: [:show, :create, :update], param: :reset_token

    resources :access_tokens, only: :create do
      delete '/', action: :destroy, on: :collection
    end
  end

  root to: 'products#index'
end
