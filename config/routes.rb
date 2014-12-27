#Rails.application.routes.draw do

   #resources :posts
  
   #get 'about' => 'welcome#about'

  #root to: 'welcome#index'
  
#end

# I added this but can't get it to show correctly 
# and application.html.erb is not behaving right either.

#Bloccit::Application
Rails.application.routes.draw do
   
   resources :posts

   
   get 'about' => 'welcome#about'

  root to: 'welcome#index'
end