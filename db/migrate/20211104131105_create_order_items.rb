class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.references :product, null: false, foreign_key: true
      t.decimal :total
      t.decimal :unit_price

      t.timestamps
    end
  end
end