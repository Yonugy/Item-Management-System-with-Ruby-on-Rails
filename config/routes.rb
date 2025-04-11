Rails.application.routes.draw do
  # Mount GraphiQL in all environments (development, production, etc.)
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"

  # POST request to handle GraphQL queries
  post "/graphql", to: "graphql#execute"

  # Health check route for monitoring purposes (Returns 200 if app is live, else 500)
  get "up" => "rails/health#show", as: :rails_health_check

  # Root route for the homepage
  root "home#index"
end
