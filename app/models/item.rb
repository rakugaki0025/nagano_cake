class Item < ApplicationRecord
## nagano_models_item
  
  
        
    ## 
  has_one_attached :image
  
    ## メソッド 1:N の関係性 [1] 削除後N全 (アソシエーション）
    ## post_comments 1:N の関係 postImageモデル = PostCommentモデル
  # has_many :post_comments, dependent: :destroy
  
    ## メソッド 1:N の関係性 [1] 削除後N全 (アソシエーション）
    ## favorites 1:N の関係 postImageモデル = PostCommentモデル
  # has_many :favorites, dependent: :destroy
  
    ##shop_nameが存在しているかを確認するバリデーション
  # validates :shop_name, presence: true
  
    ##imageが存在しているかを確認するバリデーション
  # validates :image, presence: true
  
  
    ## 引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するか
    ## 存在していればtrue、存在していなければfalseを返す
  # def favorited_by?(user)
        ## 
      #favorites.exists?(user_id: user.id)
  # end
  
  has_many :order_items, dependent: :destroy
  has_many :cart_items, dependent: :destroy
        ## ユーザーに:～属する 1:N の関係 [1] 側 送信
        ## item は cart_items に 対して 1:多 の関係である
        ## item は order_items に 対して 1:多 の関係である
        ## 削除機能
        ## たくさん持っている:モデルが 1:N になるよう関連付け:削除
  
  
        ## 消費税を求めるメソッド
  def with_tax_price
      (price * 1.1).floor
  end
  
  
        ## ActiveStorageに格納したno_image画像(D)を表示する
  def get_image
        
        ## サンプル画像を載せる記述
    unless image.attached?
        ## サンプル画像を載せる記述
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
        ## 
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
        ## 全ての画像サイズを変更する
      # image.variant(resize_to_limit: [360, 300]).processed
        ## 記述がないと目的を果たせない(画像)get_image依存
      image
        
  end
  
  
end
