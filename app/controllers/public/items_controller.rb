class Public::ItemsController < ApplicationController
  ##nagano_controllers_public_Items
  
  
        ## 顧客商品一覧画面 items_path
  def index
      
        ## インスタンス変数 = モデル名 空オブジェクト 新規作成
        ## 左の箱に右を格納
        ## インスタンス名はなんでもいい,空のオブジェクトもなんでもいい
      @item = Item.new
      
        ## 全アイテムデータ取得
      @items = Item.all
      
  end
  
  
        ## 顧客商品詳細画面 item_path
  def show
      
        ## 投稿したitem :id を取得するレコード
      @item = Item.find(params[:id])
     
      
  end
  
  
  private
  
        ## 商品詳細画面等…
  def item_params
        
        ## params  formから送られてくるデータはparamsの中
        ## require 送信データからモデル名(ここでは:item)を指定し、データを絞り込み
        ## permit  requireで絞り込んだデータの中から、保存を許可するカラムを指定
      params.require(:item).permit(:quantity )
  end
  
end
