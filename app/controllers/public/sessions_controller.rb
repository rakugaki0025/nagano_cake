## app_controllers_public_ragistrations_顧客ログイン

# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
          ## sign_in と sign_up 注意
          ## ログイン後に遷移する場所
          ## ここでのresource はログイン,ログアウト時でしか使われない
  def after_sign_in_path_for(resource)
          
          ## /homes, top画面に遷移したい
          ## ここでのresource はログイン,ログアウト時でしか使われない
      homes_path
          
  end
  
          ## ログアウト後に遷移する場所
  def after_sign_out_path_for(resource)
          
          ## public, homes/topに遷移
      homes_path
          
          
  end
  
end
