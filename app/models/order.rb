class Order < ApplicationRecord
## nagano_models_order
  
    ## ユーザーに:～属する 1:N の関係 [1] 側 送信
    ## order は order_item に 対して 1:多 の関係である
    ## 削除機能
    ## たくさん持っている:モデルが 1:N になるよう関連付け:削除
  has_many :order_items, dependent: :destroy
    
    ## ユーザーに:～属する 1:N の関係 [N]側 受け
    ## order は :customer 1:Nの N 側に当たる
  belongs_to :customer
    
    ## enum の記述,数値と文字列の紐付け
    ## rails c でそれぞれ実行すると関連ずけられているのがわかる
    ## Order.payment_methods.key(0) →        :credit_card
    ## Order.payment_methods[:credit_card] → :0
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  
end

