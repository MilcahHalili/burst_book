class AddStreetToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :street, :string
  end
end
