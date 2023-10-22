## app_controllers_public_sessions_顧客ログイン

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
  
          ## 退会ユーザーはログインできない処理 
  # def active_for_authentication?
  #         ## 
  #     super && (is_valid == true)
      
  # end
  
          ## sign_in と sign_up 注意
          ## ログイン後に遷移する場所
          ## ここでのresource はログイン,ログアウト時でしか使われない
  def after_sign_in_path_for(resource)
          
          ## /homes, top画面に遷移したい
          ## ここでのresource はログイン,ログアウト時でしか使われない
          ## root_path へ遷移
      root_path
          
  end
  
          ## ログアウト後に遷移する場所
  def after_sign_out_path_for(resource)
          
          ## public, root_to = homes/topに遷移
      root_path
          
          
  end
  
end
