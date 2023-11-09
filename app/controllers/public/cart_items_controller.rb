class Public::CartItemsController < ApplicationController
  ##nagano_controllers_public_cart_items
  
    ## カート内商品一覧画面 cart_items_path
  def index
      
        ## 
      @cart_item = Item.new
      
        ## ログインユーザーのカートアイテム
      @cart_items = current_customer.cart_items
      
  end
  
    ## カート内商品データ更新 cart_items_update
  def update
    
        ##アクセス制限
    ## is_matching_login_user
       
        ## インスタンス変数 = ユーザー_find 探す:単数でどれか一つ
        ## レコードを一つ取得？
    @cart_item = CartItem.find(params[:id])
              
        ## カート内情報を更新
    if  @cart_item.update(cart_item_params)
              
        ## flash[:notice] は 投稿が成功した時だけ表示
        ## エラーメッセージでは使わない
      flash[:notice] = "You have updated user successfully."
              
        ## 遷移先 ショッピングカート cart_items_path
      redirect_to cart_items_path
              
    else
      
        ## アクションを実行しない
      render :edit
        
    end
    
  end
  
        ## カート内商品データ削除(一商品) cart_items_destroy
  def destroy
    
        ## データ(レコード)を一件取得
      @cart_item = CartItem.find(params[:id])
        
        ## データ（レコード）を削除
      @cart_item.destroy
      
        ## カート内商品一覧画面へリダイレクト
      redirect_to '/cart_items'
        
  end
  
  
        ## カート内商品全データ削除(全て)
  def destroy_all
      
      current_customer.cart_items.destroy_all
      
        ## カート内商品一覧画面へリダイレクト
      redirect_to '/cart_items'
      
  end
  
  
        ## カート内商品データ追加
  def create
        
        ## ログインユーザーのカートアイテムの中から　現在入っているもの入れようとしてるアイテムが合致するかの記述
    if current_customer.cart_items.exists?(item_id:params[:cart_item][:item_id])
          
        ## ログインユーザーのカートアイテムの中から　現在入っているもの,入れようとしてるアイテムが合致したものを呼び出す
      @cart_item = current_customer.cart_items.find_by(item_id:params[:cart_item][:item_id])
          
        ## 上記で呼び出したものと,カートにいれようとした個数を合算する
      @cart_item.quantity += (params[:cart_item][:quantity]).to_i
        
    else
        
        ## 投稿データの保存
        ## title, body, image 格納予定 
      @cart_item = CartItem.new(cart_item_params)
         
    end
      
        ## ユーザーを ID で特定するために使用するカラム
        ## current_user.id(今ログインしているユーザーの ID)
      @cart_item.customer_id = current_customer.id
      
        ## 記録保存が成功すれば投稿一覧へ
    if @cart_item.save!
        
        ## flash[:notice] は 投稿が成功した時だけ
        ## エラーメッセージでは使わない
       flash[:notice] = "You have created book successfully."
           
        ## 遷移先 投稿一覧画面 cart_item_path
       redirect_to cart_items_path
         
    end
  end
  
  
  private
        
        ## ストロングパラメーター
        ## カート内商品等…
  def cart_item_params
        
        ## params  formから送られてくるデータはparamsの中
        ## require 送信データからモデル名(ここでは:order)を指定し、データを絞り込み
        ## permit  requireで絞り込んだデータの中から、保存を許可するカラムを指定
      params.require(:cart_item).permit(:item_id, :quantity )
  end
  
end

