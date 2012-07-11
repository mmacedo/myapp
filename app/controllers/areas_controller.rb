class AreasController < ApplicationController
  inherit_resources
  before_filter :authenticate_user!, except: [:index, :show]
  has_scope :page, default: 1
end
