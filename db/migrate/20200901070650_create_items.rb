class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name , null: false
      t.integer :price, null: false
      t.references :user, foreign_key: true
      t.text :detail, null: false
      t.integer :category_id, null: false
      t.integer :status_id  , null: false
      t.integer :delivery_fee_id, null: false
      t.integer :place_from_id, null: false
      t.integer :date_shipment_id, null: false
      t.timestamps
    end
  end
end
