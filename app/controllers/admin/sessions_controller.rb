## app_controllers_admin_sessions_管理者ログイン

# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
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
          ## 注文履歴一覧_admin_top_path へ遷移
      admin_root_path
          
  end
  
          ## ログアウト後に遷移する場所
  def after_sign_out_path_for(resource)
          
          ## customers_root_to = homes/topに遷移
      root_path
          
  end
  
end

