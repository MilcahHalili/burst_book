class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.datetime :order_date
      t.string :order_detail
      t.string :order_confirmation

      t.timestamps
    end
  end
end
