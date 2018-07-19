class AddAndRemoveParamsToOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :zipcode, :integer
    add_column :orders, :zip_code, :integer
  end
end
