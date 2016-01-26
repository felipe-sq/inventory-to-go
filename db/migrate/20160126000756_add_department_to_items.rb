class AddDepartmentToItems < ActiveRecord::Migration
  def change
    add_column :items, :department_id, :integer
    add_index :items, :department_id
  end
end
