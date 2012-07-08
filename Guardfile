guard 'bundler' do
  watch('Gemfile')
end

guard 'livereload' do
  watch(%r{app/views/.+\.haml})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  watch(%r{(app|vendor)/assets/\w+/(.+\.(css|js|html)).*})  { |m| "/assets/#{m[2]}" }
end

guard :rails, environment: :development,
              server: :unicorn do
  watch('Gemfile.lock')
  watch(%r{^(config|lib)/.*})
end

guard 'rails-assets' do
  watch(%r{^app/assets/.+$})
  watch('config/application.rb')
end

guard 'brakeman', chatty: true do
  watch(%r{^app/.+\.(erb|haml|rb)$})
  watch(%r{^config/.+\.rb$})
  watch(%r{^lib/.+\.rb$})
  watch('Gemfile.lock')
end

guard 'rails_best_practices' do
  watch(%r{^(app|spec)/(.+)\.rb$})
  watch('config/rails_best_practices.yml')
end

guard 'readme-on-github' do
  watch(/readme\.(md|markdown)/i)
end

guard 'spork', rspec_env: { 'RAILS_ENV' => 'test' },
               cucumber: false,
               test_unit: false,
               wait: 60 do
  watch('config/application.rb')
  watch('config/environment.rb')
  watch('config/environments/test.rb')
  watch(%r{^config/initializers/.+\.rb$})
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb') { :rspec }
  watch(%r{^spec/support/.+\.rb$}) { :rspec }
end

guard 'rspec', version: 2,
               cli: '--drb',
               all_on_start: false,
               all_after_pass: false do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  # Rails example
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  watch('config/routes.rb')                           { "spec/routing" }
  watch('app/controllers/application_controller.rb')  { "spec/controllers" }

  # Capybara request specs
  watch(%r{^app/views/(.+)/.*\.(erb|haml)$})          { |m| "spec/requests/#{m[1]}_spec.rb" }

  # Turnip features and steps
  watch(%r{^spec/acceptance/(.+)\.feature$})
  watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$})   { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'spec/acceptance' }
end
