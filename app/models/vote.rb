class Vote < ActiveRecord::Base
  attr_accessible :user_id, :link_id, :vote_value

  validates :user_id, uniqueness: { scope: :link_id}
  validates :vote_value, numericality: {less_than_or_equal_to: 1, greater_than_or_equal_to: -1}


  belongs_to :link
  belongs_to :user
end
