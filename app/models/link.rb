class Link < ActiveRecord::Base
  attr_accessible :user_id, :url, :title, :upvotes_count, :message, :type_of_link, :subreddit_id

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  belongs_to :subreddit

  validates :subreddit_id, presence: true
  validates_presence_of :message, if: lambda {self.type_of_link == "message"}
  validates :title, presence: true
  validates :url, allow_blank: true, format: { with: /^https?:\/\/([a-zA-Z0-9?\/._-]+)(\.[a-zA-Z0-9\/#]{2,})/ }
end
