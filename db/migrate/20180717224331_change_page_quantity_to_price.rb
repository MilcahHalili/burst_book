class ChangePageQuantityToPrice < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :page_quantity
    add_column :books, :price, :decimal
  end
end
