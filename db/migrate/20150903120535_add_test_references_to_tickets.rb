class AddTestReferencesToTickets < ActiveRecord::Migration
  def change
    add_reference :tickets, :test, index: true, foreign_key: true
  end
end
