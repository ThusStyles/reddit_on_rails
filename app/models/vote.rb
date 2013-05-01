class Vote < ActiveRecord::Base
  attr_accessible :user_id, :link_id, :vote_value

  validates :user_id, uniqueness: { scope: :link_id}


  belongs_to :link
  belongs_to :user
end
