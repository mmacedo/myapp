require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  unless ENV['DRB']
    require 'simplecov'
    SimpleCov.start 'rails'
  end

  ENV["RAILS_ENV"] ||= 'test'

  require "rails/mongoid"
  require "rails/application"
  Spork.trap_class_method(Rails::Mongoid, :load_models)
  Spork.trap_method(Rails::Application, :eager_load!)
  Spork.trap_method(Rails::Application::RoutesReloader, :reload!)

  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'email_spec'
  require 'rspec/autorun'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f }

  RSpec.configure do |config|
    config.include FactoryGirl::Syntax::Methods
    config.include EmailSpec::Helpers
    config.include EmailSpec::Matchers
    config.include ControllerMacros, type: :controller
    config.mock_with :rspec
    config.infer_base_class_for_anonymous_controllers = true
    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.filter_run focus: true
    config.run_all_when_everything_filtered = true

    # Clean up the database
    require 'database_cleaner'
    config.before(:suite) do
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.orm = "mongoid"
    end

    config.before(:each) do |x|
      DatabaseCleaner.clean

      full_description = x.example.metadata[:full_description]
      Rails.logger.info "\n\n#{full_description}\n" +
                        "#{'-' * (full_description.length)}"
    end

    Devise.stretches = 1
    config.before(:all) do
      DeferredGarbageCollection.start
    end
    config.after(:all) do
      DeferredGarbageCollection.reconsider
    end

    require 'i18n/missing_translations'
    config.after(:suite) do
      I18n.missing_translations.dump
    end
  end

end

Spork.each_run do
  if ENV['DRB']
    require 'simplecov'
    SimpleCov.start 'rails'
  end

  FactoryGirl.reload
  I18n.backend.reload!
end
