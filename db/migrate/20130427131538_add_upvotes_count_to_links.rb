class AddUpvotesCountToLinks < ActiveRecord::Migration
  def change
    add_column :links, :upvotes_count, :integer, default: 0

  end
end
