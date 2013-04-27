class RemoveUpDownFromVotes < ActiveRecord::Migration
  def up
  	remove_column :votes, :up
  	remove_column :votes, :down
  	add_column :votes, :vote_value, :integer
  end

  def down
  	remove_column :votes, :up
  	add_column :votes, :up, :boolean
  	add_column :votes, :down, :boolean
  end
end
