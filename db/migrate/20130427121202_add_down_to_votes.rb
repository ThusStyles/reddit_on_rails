class AddDownToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :down, :boolean
  end
end
