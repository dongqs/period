module ValidUserControllerHelper
  def sign_in_user role = :system
    @user ||= FactoryGirl.create role
    sign_in :user, @user
    @user
  end
end

RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
  config.include Devise::TestHelpers, :type => :view
  config.include ValidUserControllerHelper, :type => :controller
  config.include ValidUserControllerHelper, :type => :view
end

# This support package contains modules for authenticaiting
# devise users for request specs.

# This module authenticates users for request specs.#
module ValidUserRequestHelper
    # Define a method which signs in as a valid user.
    def sign_in_user role = :system
        # ASk factory girl to generate a valid user for us.
        @user ||= FactoryGirl.create role

        # We action the login request using the parameters before we begin.
        # The login requests will match these to the user we just created in the factory, and authenticate us.
        post_via_redirect user_session_path, 'user[username]' => @user.username, 'user[password]' => @user.password
    end
end

# Configure these to modules as helpers in the appropriate tests.
RSpec.configure do |config|
    # Include the help for the request specs.
    config.include ValidUserRequestHelper, :type => :request
end
