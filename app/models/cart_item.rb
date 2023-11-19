class CartItem < ApplicationRecord
## nagano_models_cartitem
  
  belongs_to :customer
  belongs_to :item
    ## ユーザーに:～属する 1:N の関係 [N]側 受け
    ## cart_item は :customer,:item 両方の 1:Nの N 側に当たる
    
    ## shop_nameが存在しているかを確認するバリデーション
  validates :item_id,  presence: true
  validates :customer_id,  presence: true
  validates :quantity,  presence: true
  
    ## 小計を求めるメソッド
  def subtotal
        
      item.with_tax_price * quantity
      
  end


end
