class AddIndexes < ActiveRecord::Migration
  def up
  	add_index :links, :user_id
  	add_index :comments, :user_id
  	add_index :comments, :link_id
  	add_index :votes, :link_id
  	add_index :votes, :user_id
  end

  def down
  	remove_index :links, :user_id
  	remove_index :comments, :user_id
  	remove_index :comments, :link_id
  	remove_index :votes, :link_id
  	remove_index :votes, :user_id
  end
end
