# RailsAdmin config file. Generated on July 05, 2012 00:16
# See github.com/sferik/rails_admin for more informations

unless Rails.env == 'test'
  RailsAdmin.config do |config|

    # If your default_local is different from :en, uncomment the following 2
    # lines and set your default locale here:
    # require 'i18n'
    # I18n.default_locale = :de

    config.current_user_method { current_user } # auto-generated

    # If you want to track changes on your models:
    # config.audit_with :history, User

    # Or with a PaperTrail: (you need to install it first)
    # config.audit_with :paper_trail, User

    # Set the admin name here (optional second array element will appear in a
    # beautiful RailsAdmin red ©)
    config.main_app_name = ['Myapp', 'Admin']
    # or for a dynamic name:
    # config.main_app_name = Proc.new do |controller|
    #   [Rails.application.engine_name.titleize,
    #    controller.params['action'].titleize]
    # end


    #  ==> Global show view settings
    # Display empty fields in show views
    # config.compact_show_view = false

    #  ==> Global list view settings
    # Number of default rows per-page:
    # config.default_items_per_page = 20

    #  ==> Included models
    # Add all excluded models here:
    # config.excluded_models = [Role, User]

    # Add models here if you want to go 'whitelist mode':
    # config.included_models = [Role, User]

    # Application wide tried label methods for models' instances
    # config.label_methods << :description # Default is [:name, :title]

    #  ==> Global models configuration
    # config.models do
    #   # Configuration here will affect all included models in all scopes,
    #   # handle with care!
    #
    #   list do
    #     # Configuration here will affect all included models in list sections
    #     # (same for show, export, edit, update, create)
    #
    #     fields_of_type :date do
    #       # Configuration here will affect all date fields, in the list
    #       # section, for all included models. See README for a comprehensive
    #       # type list.
    #     end
    #   end
    # end
    #
    #  ==> Model specific configuration
    # Keep in mind that *all* configuration blocks are optional.
    # RailsAdmin will try his best to provide the best defaults for each
    # section, for each field.
    # Try to override as few things as possible, in the most generic way. Try to
    # avoid setting labels for models and attributes, use ActiveRecord I18n API
    # instead.
    # Less code is better code!
    # config.model MyModel do
    #   # Cross-section field configuration
    #   # Name of the method called for pretty printing an *instance* of
    #   # ModelName
    #   object_label_method :name
    #   # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
    #   label 'My model'
    #   # Same, plural
    #   label_plural 'My models'
    #   # Navigation priority. Bigger is higher.
    #   weight -1
    #   # Set parent model for navigation. MyModel will be nested below.
    #   # OtherModel will be on first position of the dropdown
    #   parent OtherModel
    #   # Sets dropdown entry's name in navigation. Only for parents!
    #   navigation_label
    #   # Section specific configuration:
    #   list do
    #     # Array of field names which filters should be shown by default in the
    #     # table header
    #     filters [:id, :name]
    #     # Override default_items_per_page
    #     items_per_page 100
    #     # Sort column (default is primary key)
    #     sort_by :id
    #     # Sort direction (default is true for primary key, last created first)
    #     sort_reverse true
    #     # Here goes the fields configuration for the list view
    #   end
    # end

    # Your model's configuration, to help you get started:

    # All fields marked as 'hidden' won't be shown anywhere in the rails_admin
    # unless you mark them as visible. (visible(true))

    # config.model Role do
    #   # Found associations:
    #     configure :users, :has_and_belongs_to_many_association
    #     configure :resource, :polymorphic_association         # Hidden
    #   # Found columns:
    #     configure :_type, :text         # Hidden
    #     configure :_id, :bson_object_id
    #     configure :user_ids, :serialized         # Hidden
    #     configure :resource_type, :text         # Hidden
    #     configure :resource_id, :bson_object_id         # Hidden
    #     configure :name, :string   #   # Sections:
    #   list do; end
    #   export do; end
    #   show do; end
    #   edit do; end
    #   create do; end
    #   update do; end
    # end
    # config.model User do
    #   # Found associations:
    #     configure :roles, :has_and_belongs_to_many_association
    #   # Found columns:
    #     configure :_type, :text         # Hidden
    #     configure :_id, :bson_object_id
    #     configure :role_ids, :serialized         # Hidden
    #     configure :email, :text
    #     configure :password, :password         # Hidden
    #     configure :password_confirmation, :password         # Hidden
    #     configure :reset_password_token, :text         # Hidden
    #     configure :reset_password_sent_at, :datetime
    #     configure :remember_created_at, :datetime
    #     configure :sign_in_count, :integer
    #     configure :current_sign_in_at, :datetime
    #     configure :last_sign_in_at, :datetime
    #     configure :current_sign_in_ip, :text
    #     configure :last_sign_in_ip, :text
    #     configure :confirmation_token, :text
    #     configure :confirmed_at, :datetime
    #     configure :confirmation_sent_at, :datetime
    #     configure :unconfirmed_email, :text
    #     configure :name, :string   #   # Sections:
    #   list do; end
    #   export do; end
    #   show do; end
    #   edit do; end
    #   create do; end
    #   update do; end
    # end
  end
end