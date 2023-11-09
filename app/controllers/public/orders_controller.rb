class Public::OrdersController < ApplicationController
  ##nagano_controllers_public_cart_items
    
    
    ## 注文情報入力画面 orders_new_path
  def new
      
        ## 
      @order = Order.new
      
        ## 投稿したitem :id を取得するレコード
      #@item = Item.find(params[:id])
      @item = Item.new
      # @order = Order.find(params[:id])
      
        ## ログイン中のユーザーレコード取得
        ## current_(models名)
      @customer = current_customer
      
  end
  
           ## 注文情報確認画面 orders_conrirm_path
  def confirm
           
           ## orderの中のaddress_optionのデータを受信している
      #@test = params[:order][:address_option]
           
           ## form_with から送られるデータを受信するための記述
           ## Order.new(order_params)の受信内容が何かを覚えさせるために代入
      @order = Order.new(order_params)
           
           ## ご自身の住所を選択した場合
           ## 各paramsが受け取れるようになった
           ## 各paramsに必要なデータを渡してあげる
        #if #@test == "0"
           #p "000000"
           #p @order
        #@order.id = current_customer.id
      @order.customer_id = current_customer.id
      @order.post_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
      @order.payment_method = current_customer.id
        #@order.billing_amount = current_customer.id
      @order.postage = 800
        #@order.created_at = current_customer.created_at
        #@order.updated_at = current_customer.updated_at
       p "000000"
       p @order
      
      
      
      ## ログインユーザーのカートアイテム
      @cart_items = current_customer.cart_items
       p "111111"
       p @cart_items
           #p @order
      
        ##
      # @order_item = Order.find(order_params)
           
           ## 登録済みを選択されて場合
        #elsif @test == "1"
           #p "111111"
           
           ## 
        #else @test == "2"
           #p "222222"
           
        #end
  end
  
    ## 注文確定処理 orders_create_path
  def create
      
          ## name, introduction, price, image 格納
       @order = Order.new(order_params)
        
          ## 記録保存が成功すれば注文完了画面へ
     if @order.save
       
          ## 記録保存が成功すればカート内商品を全削除
        current_customer.cart_items.destroy_all
          
          ## 遷移先 注文完了画面へ
        redirect_to thanks_orders_path
          
     else ## 保存できなかった場合, :画像投稿フォーム再表示
        render :new
          
     end
      
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
