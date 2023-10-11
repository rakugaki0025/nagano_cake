class CreateCartItems < ActiveRecord::Migration[6.1]
## nagano_db_migrate_cartitems

  def change
    create_table :cart_items do |t|
      t.integer :item_id, null: false        # t.データ型 :カラム名, null: false
      t.integer :customer_id, null: false    # t.データ型 :カラム名, null: false
      t.integer :quantity, null: false       # t.データ型 :カラム名, null: false
      
        ## 初回生成される created_at, updated_at
      t.timestamps
    end
  end
end
