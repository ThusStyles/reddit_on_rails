class Link < ActiveRecord::Base
  attr_accessible :user_id, :url, :title, :upvotes_count, :message, :type_of_link, :subreddit_id, :subreddit_name

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  belongs_to :subreddit

  before_validation :url_to_full, if: lambda {self.type_of_link == "url"}

  validates :subreddit_id, presence: true
  validates_presence_of :message, if: lambda {self.type_of_link == "message"}
  validates :title, presence: true
  validates :url, presence: true, format: { with: /^https?:\/\/([a-zA-Z0-9?\/._-]+)(\.[a-zA-Z0-9\/#]{2,})/ }, if: lambda {self.type_of_link == "url"}

  def subreddit_name
    subreddit.try(:name)

  end

  def subreddit_name=(name)
    self.subreddit = Subreddit.find_by_name(name) if name.present?
  end
  
  def url_to_full
  	self.url = self.url.gsub(/^[w(3).]+/, "http://www.")
  end

  scope :since, lambda {|time| where("created_at > ?", time)}
end
