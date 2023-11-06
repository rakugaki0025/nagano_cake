class Customer < ApplicationRecord
## nagano_models_Customer

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  
  has_many :cart_items, dependent: :destroy
          ## ユーザーに:～属する 1:N の関係 [1] 側 送信
          ## customer は cart_items に 対して 1:多 の関係である
          ## 削除機能
          ## たくさん持っている:モデルが 1:N になるよう関連付け:削除
          
  
end
