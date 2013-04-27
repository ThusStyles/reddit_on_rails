class Link < ActiveRecord::Base
  attr_accessible :user_id, :url, :title, :upvotes_count, :message, :type_of_link

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates_presence_of :message, if: lambda {self.type_of_link == "message"}
  validates :title, presence: true
  validates :url, allow_blank: true, format: { with: /^https?:\/\/([a-zA-Z0-9?\/._-]+)(\.[a-zA-Z0-9\/#]{2,})/ }
end
