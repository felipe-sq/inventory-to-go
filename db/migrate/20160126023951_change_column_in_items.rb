class ChangeColumnInItems < ActiveRecord::Migration
  def change
    change_column :items, :reviewed, :boolean, default: false
  end
end
