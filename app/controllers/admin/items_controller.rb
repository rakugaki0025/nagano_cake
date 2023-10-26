class Admin::ItemsController < ApplicationController
##nagano_controllers_admin_items
  
  
    ## 商品一覧
  def index
  
  end
  
  
    ## 商品新規登録画面
  def new
     
  end
  
  
    ## 商品情報の新規登録
  def create
  
  end
  
  
    ## 商品詳細画面
  def show
  
  end
  
  
    ## 商品編集画面
  def edit
  
  end
  
    ## 商品情報の更新 
  def update
    
        ##アクセス制限
    ## is_matching_login_user
       
        ## インスタンス変数 = 商品_find 探す:単数でどれか一つ
        ## レコードを一つ取得？
    @items = current_item
              
        ## 商品情報 アップデート
    if  @items.update(items_params)
              
        ## flash[:notice] は 投稿が成功した時だけ表示
        ## エラーメッセージでは使わない
      flash[:notice] = "You have updated user successfully."
              
        ## インスタンス変数 = ユーザー_find 探す:単数でどれか一つ  user_path(@user.id)
        ## 遷移先 '/customer' customer_path(@user.id)
      redirect_to items_show_path(@items.id)
              
    else
      
        ## アクションを実行しない
      render :edit
        
    end
  end
  
  
  
  private
  
        ## 商品登録情報編集画面等で使用…
  def items_params
        
        ## params  formから送られてくるデータはparamsの中
        ## require 送信データからモデル名(ここでは:customer)を指定し、データを絞り込み
        ## permit  requireで絞り込んだデータの中から、保存を許可するカラムを指定
      params.require(:items).permit(:name, :introduction, :price )
  end
  
end

