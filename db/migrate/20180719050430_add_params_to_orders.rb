class AddParamsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :name, :string
    add_column :orders, :street, :string
    add_column :orders, :city, :string
    add_column :orders, :zipcode, :integer
    add_column :orders, :special_instructions, :string
  end
end
