

Bloccit::Application.routes.draw do

  devise_for :users
   resources :posts
   resources :topics

      get 'about' => 'welcome#about'

        root to: 'welcome#index'

end