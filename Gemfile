source 'https://rubygems.org'
#ruby '2.2.1'    # i add this but at bundle command for database cleaner, it complained about this ruby version
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.7'

# Use sqlite3 as the database for Active Record
			#gem 'sqlite3'

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development do
  gem 'sqlite3'
  gem 'spring' #group: :development   
end

 group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'capybara', '~> 2.4.4'   #Capybara is an integration testing tool/ simulates how a user would interact
  gem 'factory_girl_rails', '~> 4.0'
  gem 'database_cleaner'
end
# Use SCSS for stylesheets

gem 'sass-rails', '~> 4.0.3'

gem 'bootstrap-sass', '~> 3.1.1'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

gem 'faker'
gem 'devise'
#Devise is a full-featured authentication system that you can integrate with a Rails app.

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',     group: :doc

#gem 'rails_12factor', group: :production

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
 #can I move this to group: development ? 

#ruby '2.0.0'

gem 'figaro', '1.0'
# Figaro was written to make it easy to securely configure Rails applications.
gem 'pundit'
#a gem that makes it easier to authorize different users for different tasks in your app

gem 'redcarpet'

gem 'simple_form'

gem 'country_select'

# image loading
gem 'carrierwave'
gem 'mini_magick'
gem 'fog'
gem 'will_paginate', '~> 3.0.5'

# performance monitoring
gem 'newrelic_rpm'
gem 'puma'  #server set up April 9 for "popular posts checkpoint" for dev and prod?

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]



# for testing: 
#gem 'test_helper', '~> 0.0.1'
