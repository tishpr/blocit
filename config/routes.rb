Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'

  get 'welcome/map'

  get'welcome/login'

root to: 'welcome#index'
  
end
