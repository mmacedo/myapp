module ControllerMacros

  def self.included(base)
    base.extend(GroupMethods)
  end

  module GroupMethods

    def login_user
      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        user = create(:user)
        sign_in user
      end
    end

  end

end