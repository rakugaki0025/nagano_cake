class Public::OrdersController < ApplicationController
  ##nagano_controllers_public_cart_items
    
    
    ## 注文情報入力画面 orders_new_path
  def new
      
        ## 
      @order = Order.new
      
      # @order = Order.find(params[:id])
      
  end
  
    ## 注文情報確認画面 orders_conrirm_path
  def confirm
  
  end
  
    ## 注文確定処理 orders_create_path
  def create
  
  end
  
    ## 注文完了画面 orders_thanks_path
  def thanks
  
  end
  
    ## 注文履歴画面 orders_index_path
  def index
      
        ## 
      # @order = Order.new
      
        ## 全注文データ取得
      # @orders = Order.all # or 他のクエリで適切な値を取得する
      
      
      ## 全注文データ取得
     # @orders = Order.all
     
     #if # @orders.nil? # もし注文データが存在しない場合
        
        # @orders = [] # 空の配列を代入することでnilエラーを回避
        
     #end
     
  end
  
    ## 注文履歴詳細画面 orders_show_path
  def show
  
  end
  
  
  private
  
        ## 注文詳細画面等…
  def order_params
        
        ## params  formから送られてくるデータはparamsの中
        ## require 送信データからモデル名(ここでは:order)を指定し、データを絞り込み
        ## permit  requireで絞り込んだデータの中から、保存を許可するカラムを指定
      params.require(:order).permit(:customer_id, :post_code, :address, :name, :payment_method, :billing_amount, :postage )
  end
  
end
