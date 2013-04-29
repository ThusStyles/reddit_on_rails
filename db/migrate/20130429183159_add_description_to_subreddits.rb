class AddDescriptionToSubreddits < ActiveRecord::Migration
  def change
    add_column :subreddits, :description, :text
  end

  add_index :links, :subreddit_id
end
