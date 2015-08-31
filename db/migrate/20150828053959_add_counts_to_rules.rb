class AddCountsToRules < ActiveRecord::Migration
  def change
    add_column :rules, :count_positive, :integer, :default => 0
    add_column :rules, :count_negative, :integer, :default => 0
  end
end
