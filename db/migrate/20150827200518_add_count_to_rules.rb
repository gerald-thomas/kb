ass AddCountToRules < ActiveRecord::Migration
  def change
    add_column :rules, :count, :integer
  end
end