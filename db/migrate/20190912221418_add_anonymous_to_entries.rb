class AddAnonymousToEntries < ActiveRecord::Migration
  def change
    add_column :suggestion_entries, :anonymous, :boolean, default: true 
  end
end
