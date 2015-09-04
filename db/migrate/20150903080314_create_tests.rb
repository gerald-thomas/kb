class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.boolean :result
      t.references :rule, index: true, foreign_key: true
      t.references :ticket, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
