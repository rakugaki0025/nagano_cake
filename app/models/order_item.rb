class OrderItem < ApplicationRecord
## nagano_models_order_item
  
  belongs_to :item
  belongs_to :order
    ## ユーザーに:～属する 1:N の関係 [N]側 受け
    ## order_item は :order 1:Nの N 側に当たる
  
end
