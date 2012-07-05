require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']
source 'https://rubygems.org'
gem 'rails', '3.2.6'
group :assets do
  gem 'less-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem "therubyracer", :platform => :ruby
  gem "twitter-bootstrap-rails"
end
gem 'jquery-rails'
gem "debugger", :group => [:development, :test]
gem "unicorn-rails", :group => [:development, :test]
gem "simplecov", :require => false, :group => :test
gem "metrical", :require => false, :group => :development
gem "brakeman", :require => false, :group => :development
gem "rails_best_practices", :require => false, :group => :development
gem "bson_ext"
gem "mongoid"
gem "redis"
gem "resque"
gem "less"
gem "devise"
gem "cancan"
gem "rolify"
gem "rails-footnotes", :group => :development
gem "will_paginate_mongoid"
gem "inherited_resources"
gem "simple_form"
gem "mongoid-paperclip"
gem "haml"
gem "haml-rails", :group => :development
gem "rspec-rails", :group => [:development, :test]
gem "database_cleaner", :group => :test
gem "mongoid-rspec", "= 1.4.5", :group => :test
gem "factory_girl_rails", :group => [:development, :test]
gem "email_spec", :group => :test
gem "guard", :group => :development  
case HOST_OS
  when /darwin/i
    gem 'rb-fsevent', :group => :development
    gem 'growl', :group => :development
  when /linux/i
    gem 'libnotify', :group => :development
    gem 'rb-inotify', :group => :development
  when /mswin|windows/i
    gem 'rb-fchange', :group => :development
    gem 'win32console', :group => :development
    gem 'rb-notifu', :group => :development
end
gem "guard-bundler", :group => :development
gem "guard-brakeman", :group => :development
gem "guard-rails_best_practices", :group => :development
gem "guard-readme-on-github", :group => :development
gem "guard-rails-assets", :group => :development
gem "guard-rails", :group => :development
gem "guard-livereload", :group => :development
gem "guard-rspec", :group => :development
gem "guard-redis", :group => :development
gem "guard-resque", :group => :development
gem "poltergeist", :group => [:development, :test]
gem "rails_admin"