Rails.application.routes.draw do
   devise_for :users
  scope module: :public do
    root to: "homes#top"
    get 'about', to: "homes#about"
    resources :users, only: [:edit,:index,:show,:update,:destroy]
    resources :posts
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
