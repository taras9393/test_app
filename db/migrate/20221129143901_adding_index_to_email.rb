class AddingIndexToEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :nick, unique: true
  end
end
