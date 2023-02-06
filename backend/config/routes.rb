Rails.application.routes.draw do
  # GraphQL API
  # post "/graphql", to: "graphql#execute"

  # if Rails.env.development?
  #   mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "graphql#execute"
  # end

  # Just a blank root path
  root 'pages#blank'
end
