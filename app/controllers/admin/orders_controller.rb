class Admin::OrdersController < ApplicationController
  ##nagano_controllers_admin_orders
  
  def show
      
        ## order id を呼び出す記述
      @order = Order.find(params[:id])
      
        ## 計算を始める
      @sum = 0
      
        ## 注文全体を呼び出す
      @order.order_items.each do |order_item|
        
        ## さらに order_item から [.カラム] で 必要なカラムを呼び出す
      @sum += order_item.tax_included_price * order_item.quantity
      
      
      end
      
  end
  
  
end

