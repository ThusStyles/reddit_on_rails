class ChangeTypeToTypeoflink < ActiveRecord::Migration
  def up
  	rename_column :links, :type, :type_of_link
  end

  def down
  	rename_column :links, :type_of_link, :type
  end
end
