class Admin::ItemsController < ApplicationController
    ##nagano_controllers_admin_items
  
   # before_action :authenticate_customer!, except: [:top, :about]
          # ログイン認証が済んでない,ログイン画面にリダイレクト
       
  
    ## 商品新規登録画面 admin_new_path
  def new
    
        ## インスタンス変数 = モデル名 空オブジェクト 新規作成
        ## 左の箱に右を格納
        ## インスタンス名はなんでもいい,空のオブジェクトもなんでもいい
      @item = Item.new
      
        ## データ（レコード）を1件取得_paramsを格納
      ##@items = Item.find(params[:id])
      
  end
  
    ## 商品情報の新規登録 admin_items_path
  def create
      
          ## name, introduction, price, image 格納
       @item = Item.new(item_params)
        
          ## 記録保存が成功すれば投稿一覧へ
     if @item.save
          
          ## 遷移先 商品投稿一覧画面
        redirect_to admin_items_path
          
     else ## 保存できなかった場合, :画像投稿フォーム再表示
        render :new
          
     end
      
  end
  
  
    ## 商品一覧
  def index
    
        ## インスタンス変数 = モデル名 空オブジェクト 新規作成
        ## 左の箱に右を格納
        ## インスタンス名はなんでもいい,空のオブジェクトもなんでもいい
      @item = Item.new
      
        ## 全アイテムデータ取得
      @items = Item.all
      
  end
  
  
    ## 商品詳細画面_admin_show_path
  def show
    
        ## 投稿したitem :id を取得するレコード
      @item = Item.find(params[:id])
      
  end
  
  
    ## 商品編集画面_admin_edit_path
  def edit
      
        ## 投稿したitem :id を取得するレコード
      @item = Item.find(params[:id])
      
  end
  
    ## 商品情報の更新 admin_update_path
  def update
    
        ##アクセス制限
    ## is_matching_login_user
       
        ## インスタンス変数 = 商品_find 探す:単数でどれか一つ
        ## レコードを一つ取得？
    @item = Item.find(params[:id])
              
        ## 商品情報 アップデート
    if  @item.update(item_params)
              
        ## flash[:notice] は 投稿が成功した時だけ表示
        ## エラーメッセージでは使わない
      flash[:notice] = "You have updated user successfully."
              
        ## インスタンス変数 = ユーザー_find 探す:単数でどれか一つ  user_path(@user.id)
        ## 遷移先 '/customer' customer_path(@user.id)
      redirect_to admin_show_path(@item.id)
              
    else
      
        ## アクションを実行しない
      render :edit
        
    end
  end
  
  
  
  private
  
        ## 商品登録情報編集画面等で使用…
  def item_params
        
        ## params  formから送られてくるデータはparamsの中
        ## require 送信データからモデル名(ここでは:item)を指定し、データを絞り込み
        ## permit  requireで絞り込んだデータの中から、保存を許可するカラムを指定
      params.require(:item).permit(:name, :introduction, :price, :image, )
  end
  
end

