class AddMessageToLinks < ActiveRecord::Migration
  def change
    add_column :links, :message, :text
  end
end
