class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.string :name
      t.text :excel
      t.text :test
      t.boolean :branch

      t.timestamps null: false
    end
  end
end
