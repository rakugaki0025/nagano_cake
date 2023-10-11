class CreateOrders < ActiveRecord::Migration[6.1]
## nagano_db_migrate_orders

  def change
    create_table :orders do |t|
      
      t.integer :customer_id, null: false      # t.データ型 :カラム名, null: false
      t.string :post_code, null: false         # t.データ型 :カラム名, null: false
      t.string :address, null: false           # t.データ型 :カラム名, null: false
      t.string :name, null: false              # t.データ型 :カラム名, null: false
      t.integer :payment_method, null: false   # t.データ型 :カラム名, null: false
      t.integer :billing_amount, null: false   # t.データ型 :カラム名, null: false
      t.integer :postage, null: false          # t.データ型 :カラム名, null: false
      
        ## 初回生成される created_at, updated_at
      t.timestamps
    end
  end
end
