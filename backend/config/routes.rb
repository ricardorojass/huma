Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "graphql#execute"
  end
  post "/graphql", to: "graphql#execute"
end
