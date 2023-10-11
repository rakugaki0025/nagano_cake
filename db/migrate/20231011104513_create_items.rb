class CreateItems < ActiveRecord::Migration[6.1]
## nagano_db_migrate_items

  def change
    create_table :items do |t|
      
      t.string :name, null: false         # t.データ型 :カラム名, null: false
      t.text :introduction, null: false   # t.データ型 :カラム名, null: false
      t.integer :price, null: false       # t.データ型 :カラム名, null: false
      
        ## 初回生成される created_at, updated_at
      t.timestamps
    end
  end
end
