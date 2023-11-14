class Admin::HomesController < ApplicationController
##nagano_controllers_admin_homes
  
    ## 注文履歴一覧
  def top
        
        ## 
      @order = Order.all
      
  end
  
  
end

