class Public::HomesController < ApplicationController
##nagano_controllers_public_homes
  
    ## 顧客のトップページ
  def top
      
        ## インスタンス変数 = モデル名 空オブジェクト 新規作成
        ## 左の箱に右を格納
        ## インスタンス名はなんでもいい,空のオブジェクトもなんでもいい
      @item = Item.new
      
        ## 全アイテムデータ取得
      @items = Item.all
      
  end
    
    ## 顧客のアバウト
  def about
    
  end

end
