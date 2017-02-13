Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, path: 'admin'

  namespace :admin do
    root to: redirect('/admin/restaurants/')
    get 'home' => 'home#index', as: :home

    resources :restaurants do
      resources :categories
    end

  end
end
