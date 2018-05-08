Rails.application.routes.draw do
  get 'users/login'
  root 'static_pages#homepage'
  resources :posts
  get  'users/signup',  to: 'users#new'
  resources :users


  if Rails.env.development?
      mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
    end
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
