class Admin::HomesController < ApplicationController
##nagano_controllers_admin_homes
  
    ## ordersを使う
  def top
    
        ## インスタンス変数 = モデル名 空オブジェクト 新規作成
        ## 左の箱に右を格納
        ## インスタンス名はなんでもいい,空のオブジェクトもなんでもいい
      @customer = Customer.new
      
      # @customer = Customer.find(params[:id])
      
        ## 全顧客データ取得
      @customers = Customer.all
      
  end
  
  
end

