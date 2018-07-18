class AddParamsToDeliveries < ActiveRecord::Migration[5.2]
  def change
    add_column :deliveries, :city, :string
    add_column :deliveries, :street, :string
    add_column :deliveries, :zip_code, :integer
  end
end
