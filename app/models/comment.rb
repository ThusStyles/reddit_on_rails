class Comment < ActiveRecord::Base
  attr_accessible :user_id, :link_id, :message

  belongs_to :user
  belongs_to :link
end
