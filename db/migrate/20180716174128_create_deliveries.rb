class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.datetime :delivery_date
      t.string :delivery_confirmation
      t.string :special_instructions

      t.timestamps
    end
  end
end
