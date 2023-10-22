Rails.application.routes.draw do
## nagano_config_routes
  
  ## 顧客用
  ## URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
    
    ## 管理者用
    ## URL /admin/sign_in ...
    devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
   # scopeでは /public とは表示されない 例 /homes
  scope module: :public do
    
      ## root to設定で homes/topページ遷移設定
    root to: 'homes#top'
    
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    get 'homes/about' => "homes#about", as: 'about'
    
      ## 顧客のマイページ
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    get 'customers/my_page' => "customers#show", as: 'customers_my_page'
    
      ## 顧客の登録情報編集画面
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    get 'customers/information/edit' => "customers#edit", as: 'information_edit'
    
      ## 顧客の update patch
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    patch 'customers/information' => "customers#update", as: 'information_update'
    
      ## 顧客の退会確認画面
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    get 'customers/confirm' => "customers#confirm", as: 'confirm'
    
      ## 顧客の退会処理(ステータスの更新)
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    patch 'customers/withdrow' => "customers#withdrow", as: 'withdrow'
    
  end
  
   # namespaceでは /admin が表示される 例 /admin/homes
  namespace :admin do
    get 'homes' => 'homes#top'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
