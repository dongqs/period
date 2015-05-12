class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # controller_helpers
  skip_before_action :verify_authenticity_token, if: :skip_authenticity?
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :log_current_user

  def log_current_user
    logger.info "Current user: #{current_user.email}" if current_user
  end

  def redirect_back default_path = :root, options = {}
    redirect_to :back, options
  rescue ActionController::RedirectBackError
    redirect_to default_path, options
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :email
  end

  def skip_authenticity?
    request.format.json? or params[:skip_authenticity]
  end

  # authentication_token
  before_action :authenticate_user_from_token!

  def authenticate_user_from_token!
    auth_token = params[:auth_token].presence
    user       = auth_token && User.find_by_authentication_token(auth_token.to_s)

    if user
      # Notice we are passing store false, so the user is not
      # actually stored in the session and a token is needed
      # for every request. If you want the token to work as a
      # sign in token, you can simply remove store: false.
      sign_in user, store: false
    end
  end

  # authorization

  before_action :authenticate_normal!, unless: :devise_controller?

  class AuthenticationError < SecurityError; end
  class AuthorizationError < SecurityError; end

  rescue_from AuthenticationError do |exception|
    flash[:error] = exception.to_s
    redirect_to :root
  end

  rescue_from AuthorizationError do |exception|
    flash[:error] = exception.to_s
    redirect_to :root
  end

  def authenticate_current_user! user
    raise AuthorizationError unless current_user == user or current_user.system?
  end

  def authenticate_role! role, resource = nil
    return unless user_signed_in?
    unless current_user.has_role? role
      raise AuthenticationError, "#{current_user.name} not authenticated as a #{role} user"
    end
  end

  def authenticate_any_role! *roles
    return unless user_signed_in?
    unless current_user.has_any_role? *roles
      raise AuthenticationError, "#{current_user.name} not authenticated as any of #{roles.join(", ")}"
    end
  end

  Role::USER_ROLES.each do |role|
    define_method "authenticate_#{role.to_s}!" do
      authenticate_role! role
    end
  end

end
