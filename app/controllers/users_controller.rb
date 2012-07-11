class UsersController < ApplicationController
  inherit_resources
  before_filter :authenticate_user!
  actions :index, :show
  has_scope :page, default: 1

  def index
    authorize! :index, @user, message: 'Not authorized as an administrator.'
    index!
  end

end
