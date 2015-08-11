class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :ticket
      t.boolean :test1
      t.boolean :test1
      t.boolean :test2
      t.boolean :test3
      t.boolean :test4
      t.boolean :test5
      t.boolean :test6
      t.boolean :test7
      t.boolean :test8
      t.boolean :test9
      t.boolean :test10
      t.boolean :branch
      t.integer :rule

      t.timestamps null: false
    end
  end
end
