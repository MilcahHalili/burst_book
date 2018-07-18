class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.references :customer, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
