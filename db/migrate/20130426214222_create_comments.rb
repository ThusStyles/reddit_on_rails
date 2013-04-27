class CreateComments < ActiveRecord::Migration
  def up
  	create_table :comments do |t|
  		t.string :message
  		t.integer :user_id
  		t.integer :link_id

  		t.timestamps

  	end
  end

  def down
  end
end
