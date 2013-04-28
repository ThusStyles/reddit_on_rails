class CreateSubreddits < ActiveRecord::Migration
  def change
    create_table :subreddits do |t|
    	t.string :name
    	t.integer :user_id

      t.timestamps
    end

    add_index :subreddits, :user_id
    add_index :subreddits, :name
  end
end
