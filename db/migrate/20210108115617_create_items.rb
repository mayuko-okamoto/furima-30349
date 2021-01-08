class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :title,              null: false
      t.text       :nickname,           null: false
      t.integer    :price,              null: false, inclusion: { in: 300..9999999 }
      t.integer    :category_id,        null: false
      t.integer    :condition_id,       null: false
      t.integer    :shipping_payer_id,  null: false
      t.integer    :prefecture_id,      null: false
      t.integer    :storage_date_id,    null: false
      t.references :user,               foreign_key: true

      t.timestamps
    end
  end
end

