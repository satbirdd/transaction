class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.string :name
      t.references :order
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
