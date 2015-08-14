class CreateBins < ActiveRecord::Migration
  def change
    create_table :bins do |t|
      t.string :name
      t.integer :rule
      t.boolean :branch
      t.string :ticket, limit: 30
      t.integer :ticketID

      t.timestamps null: false
    end
  end
end
