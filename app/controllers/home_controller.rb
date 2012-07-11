class HomeController < ApplicationController
  inherit_resources
  defaults resource_class: User, collection_name: :users, instance_name: :user
  actions :index
  has_scope :page, default: 1
end
