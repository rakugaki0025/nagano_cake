class CreateOrderItems < ActiveRecord::Migration[6.1]
## nagano_db_migrate_order_items

  def change
    create_table :order_items do |t|
      
      t.integer :item_id, null: false              # t.データ型 :カラム名, null: false
      t.integer :order_id, null: false             # t.データ型 :カラム名, null: false
      t.integer :tax_included_price, null: false   # t.データ型 :カラム名, null: false
      t.integer :quantity, null: false             # t.データ型 :カラム名, null: false
      
        ## 初回生成される created_at, updated_at
      t.timestamps
    end
  end
end
