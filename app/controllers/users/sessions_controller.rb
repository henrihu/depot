class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  def omniauthuser
    # raise request.env["omniauth.auth"].to_yaml
    auth = request.env["omniauth.auth"]
    @user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)

    # @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end
  #
  # # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
