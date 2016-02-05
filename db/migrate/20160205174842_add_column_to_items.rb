class AddColumnToItems < ActiveRecord::Migration
  def change
    add_column :items, :min_stock_level, :integer, default: 0
  end
end
