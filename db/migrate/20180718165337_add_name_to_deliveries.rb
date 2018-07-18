class AddNameToDeliveries < ActiveRecord::Migration[5.2]
  def change
    add_column :deliveries, :name, :string
  end
end
