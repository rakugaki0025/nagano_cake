class Public::OrdersController < ApplicationController
  ##nagano_controllers_public_orders
    
    
    ## 注文情報入力画面 new_order_path
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
  
           ## 注文情報確認画面 conrirm_orders_path
  def confirm
           
           ## orderの中のaddress_optionのデータを受信している
      # @test = params[:order][:address_option]
           
           ## form_with から送られるデータを受信するための記述
           ## Order.new(order_params)の受信内容が何かを覚えさせるために代入
      @order = Order.new(order_params)
        
           ## ご自身の住所を選択した場合
           ## 各paramsが受け取れるようになった
           ## 各paramsに必要なデータを渡してあげる
        # if #@test == "0"
           #p "000000"
           #p @order
        # @order.id = current_customer.id
      @order.customer_id = current_customer.id
      @order.post_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
        #@order.payment_method = current_customer.id
        # @order.billing_amount = current_customer.id
      @order.postage = 800
        # @order.created_at = current_customer.created_at
        # @order.updated_at = current_customer.updated_at
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
        # elsif @test == "1"
           #p "111111"
           
           ## 新規東麓の場合
        # else @test == "2"
           #p "222222"
           
        # end
  end
  
          ## 注文確定処理 orders_create_path
  def create
      
          ## name, introduction, price, image 格納
       @order = Order.new(order_params)
        
          ## 記録保存が成功すれば注文完了画面へ
     if @order.save
        
        @cart_items = current_customer.cart_items
        
        @cart_items.each do |cart_item|
          ## 空箱用意
        @order_item = OrderItem.new
          ## 各箱に必要なデータを入れていく
        @order_item.order_id = @order.id
        @order_item.item_id = cart_item.item.id
        @order_item.tax_included_price = cart_item.item.price * 1.1
        @order_item.quantity = cart_item.quantity
        #@order_item.manufacture_status = 0
        @order_item.save!
        
        end
        
        
          ## 記録保存が成功すればカート内商品を全削除
        current_customer.cart_items.destroy_all
          
          ## 遷移先 注文完了画面へ
        redirect_to thanks_orders_path
          
     else ## 保存できなかった場合, :画像投稿フォーム再表示
        render :new
          
     end
      
  end
  
        ## 注文完了画面 thanks_orders_path
  def thanks
  
  end
  
        ## 注文履歴一覧画面 orders_path
  def index
    
        ## order,内に含まれるorder_itemsを呼び出す記述
      @orders = current_customer.orders
      
  end
  
        ## 注文履歴詳細画面 order_path
  def show
    
        ## order,内に含まれるorder_itemsを呼び出す記述
      @order = current_customer.orders.find(params[:id])
      
        ## 計算を始める
      @sum = 0
      
        ## 注文全体を呼び出す
      @order.order_items.each do |order_item|
        
        ## さらに order_item から [.カラム] で 必要なカラムを呼び出す
      @sum += order_item.tax_included_price * order_item.quantity
      
      
      end
      
      
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

