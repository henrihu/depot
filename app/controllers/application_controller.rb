class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!  #:authorize
  before_action :set_i18n_locale_from_params
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  alias_method :devise_current_user, :current_user
  def current_user
     devise_current_user || current_saler
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :employee
      devise_parameter_sanitizer.for(:account_update) << :employee
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:avatar) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:avatar) }
    end
    # def authorize
    #   if User.count == 0
    #     if request.path_parameters[:controller] == 'users' and request.path_parameters[:action] == 'create'
    #       #do nothing. let the users controoler verify that everything is correct
    #     elsif !(request.path_parameters[:controller] == 'users' and request.path_parameters[:action] == 'new')
    #       flash[:notice] = "Please create Admin User"
    #       redirect_to :controller => 'users' , :action => 'new'
    #     end
    #   elsif !User.find_by(id: session[:user_id])
    #     redirect_to login_url, notice: "Please log in"
    #   end
    # end


    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.map(&:to_s).include?(params[:locale])
          I18n.locale = params[:locale]
        else
          flash.now[:notice] =
              "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end
    def default_url_options
      { locale: I18n.locale }
    end
end
