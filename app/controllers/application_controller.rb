class ApplicationController < ActionController::Base
  ## nagano_models_application_controller
  ## 全てのコントローラに対する処理を行える権限を持つ
  
  # before_action :authenticate_user!, except: [:top, :about]
  #         # ログイン認証が済んでない,ログイン画面にリダイレクト
  
  before_action :configure_permitted_parameters, if: :devise_controller?
    # ユーザー,ログイン　の前にメソッド実装
  
  
  
  # def after_sign_in_path_for(resource)
  #         # ログイン後に遷移する場所
  #         # ここでのresource はログイン,ログアウト時でしか使われない
          
  #     user_path(resource)
  #         # user/showに遷移したい
  #         # ここでのresource はログイン,ログアウト時でしか使われない
          
  # end
  
  
  # def after_sign_out_path_for(resource)
  #         # ログアウト後に遷移する場所
          
  #     root_path
  #         # rootに遷移
          
  # end
  
  
  protected

  def configure_permitted_parameters
          
          # メソッド ユーザー登録(sign_up)の際に、
          # ストリングパラメータと同様の機能
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
  end

  
  
end


