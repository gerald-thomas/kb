class AddAncestryToRule < ActiveRecord::Migration

  def self.up  
    add_column :rules, :ancestry, :string  
    add_index :rules, :ancestry  
  end  
  
  def self.down  
    remove_index :rules, :ancestry  
    remove_column :rules, :ancestry  
  end 
end
