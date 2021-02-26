Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    get '/signin', to: 'sessions#new'
    get '/signup', to: 'users#new'
    get '/signout', to: 'sessions#destroy'
    root 'posts#index'
    get 'main/profile'
    get 'session/destroy'
    get 'posts/my_posts'
    resources :sessions, only: %i[new create destroy]
    resources :users
    resources :posts
  end
end
