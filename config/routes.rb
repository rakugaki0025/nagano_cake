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
    
### public_customers    
    
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
    
### public_items
    
      ## 顧客の商品一覧
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    get 'items' => "items#index", as: 'items'
    
      ## 顧客の商品詳細
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    get 'items/:id' => "items#show", as: 'item'
    
### public_cart_items
    
      ## カート内商品全データ削除(全て)
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    delete 'cart_items/destroy_all' => "cart_items#destroy_all", as: 'cart_items_destroy_all'
      
      ## index   : カート内商品一覧画面(数量・カート削除)
      ## create  : カート内商品データ追加
      ## update  : カート内商品データ更新
      ## destroy : カート内商品データ削除(一商品)
      ## cart_itemsディレクトリ ルーティング自動生成 onlyで(限定生成)
    resources :cart_items, only: [:index, :edit, :create, :update, :destroy]
      
### public_orders
      
      ## new    : 注文情報入力画面(支払い方法)
      ## index  : 注文履歴一覧画面
      ## show   : 注文履歴詳細画面
      ## create : 注文情報確定
      ## ordersディレクトリ ルーティング自動生成 onlyで(限定生成)
      ## resources :orders, only: [:new, :index, :show, :create, :edit, :update, :destroy]
    resources :orders, only: [:new, :index, :show, :create ] do
    
    collection do
      get :thanks
      
      post :confirm
      
    end
  end
      ## 注文情報確認画面
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    #post 'orders/confirm' => "orders#confirm", as: 'orders_confirm'
      
      ## 注文完了画面(サンクスページ)
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    #get 'orders/thanks' => "orders#thanks", as: 'orders_thanks'
    
  end
  
  
   # namespaceでは /admin が表示される 例 /admin/homes
  namespace :admin do
    
      ## 管理者トップページ(注文履歴一覧)
      ## root to設定で admin_homes/topページ遷移設定
    root to: 'homes#top'
    
### admin_items
    
      ## 商品一覧画面
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    get 'items' => "items#index", as: 'items'
    
      ## 商品新規登録画面
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    get 'items/new' => "items#new", as: 'new'
    
      ## 商品情報の新規登録
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    post 'items' => "items#create", as: 'create'
    
      ## 商品詳細画面
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    get 'items/:id' => "items#show", as: 'show'
    
      ## 商品編集画面
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    get 'items/:id/edit' => "items#edit", as: 'edit'
    
      ## 商品情報の更新
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    patch 'items/:id' => "items#update", as: 'update'
    
### admin_customers
    
      ## 顧客一覧画面 ?
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    get 'customers' => "customers#index", as: 'customers'
    
      ## 顧客詳細画面
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    get 'customers/:id' => "customers#show", as: 'customers_show'
    
      ## 顧客編集画面
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    get 'customers/:id/edit' => "customers#edit", as: 'customers_edit'
    
      ## 顧客情報の登録
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    patch 'customers/:id' => "customers#update", as: 'customers_update'
    
### admin_orders
    
      ## 注文詳細画面
      ## 取得 '実際の表示アドレス' => "指定のコントローラー#アクション", as: "名前つきルート"
    get 'orders/:id/' => "orders#show", as: 'orders_show'
    
    
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
