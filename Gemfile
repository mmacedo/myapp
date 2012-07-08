source 'https://rubygems.org'
gem 'rails', '3.2.6'
group :assets do
  gem 'less-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'therubyracer', platform: :ruby
  gem 'twitter-bootstrap-rails'
end
gem "haml"
gem 'haml-rails', group: :development
gem 'jquery-rails'
gem 'bson_ext'
gem 'mongoid'
gem 'mongoid-paperclip'
gem 'devise'
gem 'cancan'
gem 'rolify'
gem 'will_paginate_mongoid'
gem 'inherited_resources'
gem 'simple_form'
gem 'rails_admin'
gem 'heroku', group: :production
gem 'yajl-ruby'

# Development tools
gem 'debugger', group: [:development, :test]
gem 'unicorn-rails', group: [:development, :test]
group :development do
  gem 'metrical', require: false
  gem 'brakeman', require: false
  gem 'rails_best_practices', require: false, git: 'https://github.com/railsbp/rails_best_practices'
  gem 'rails-footnotes'
end

# Test
gem 'rspec-rails', group: [:development, :test]
gem 'database_cleaner', group: :test
gem 'mongoid-rspec', '1.4.5', group: :test
gem 'factory_girl_rails', group: [:development, :test]
gem 'email_spec', group: :test
gem 'poltergeist', group: [:development, :test]
gem 'simplecov', require: false, group: :test
gem 'spork', group: :test

# Guard
group :development do
  require 'rbconfig'
  HOST_OS = RbConfig::CONFIG['host_os']
  gem 'guard'
  case HOST_OS
    when /darwin/i
      gem 'rb-fsevent'
      gem 'growl'
    when /linux/i
      gem 'libnotify'
      gem 'rb-inotify'
    when /mswin|windows/i
      gem 'rb-fchange'
      gem 'win32console'
      gem 'rb-notifu'
  end
  gem 'guard-bundler'
  gem 'guard-brakeman'
  gem 'guard-rails_best_practices'
  gem 'guard-readme-on-github'
  gem 'guard-rails-assets'
  gem 'guard-rails', git: 'https://github.com/mmacedo/guard-rails',
                     branch: 'environment'
  gem 'guard-livereload'
  gem 'rack-livereload'
  gem 'guard-rspec'
end
gem 'guard-spork', group: :test