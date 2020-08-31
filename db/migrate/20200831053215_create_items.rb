class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :price
      t.text :exhibitor
      t.text :itemName
      t.timestamps
    end
  end
end
