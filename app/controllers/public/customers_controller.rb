class Public::CustomersController < ApplicationController
##nagano_controllers_public_customers

    ## 顧客のマイページ
  def show
      
        ## ログイン中のユーザーレコード取得
        ## current_(models名)
      @customer = current_customer
      
        
      
  end
  
    ## 顧客の登録情報編集画面
  def edit
      
        ## ログイン中のユーザーレコード取得
        ## current_(models名)
      @customer = current_customer
      
  end
  
    ## 顧客の退会画面
  def confirm
      
  end
  
end

