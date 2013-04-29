class Subreddit < ActiveRecord::Base
  attr_accessible :name, :user_id, :description

  belongs_to :user
  has_many :links, dependent: :destroy

  before_validation :strip_blanks

  validates :description, presence: true, length: {minimum: 10, maximum: 200}
  validates :name, presence: true, uniqueness: true

  def to_param
  	name
  end

   protected
 
   def strip_blanks
     self.name = self.name.strip
     self.name = self.name.gsub(/\s+/, "")
   end
end
