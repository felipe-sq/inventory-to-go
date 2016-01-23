class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :amount
      t.boolean :reviewed

      t.timestamps null: false
    end
  end
end
