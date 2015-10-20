class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_and_belongs_to_many :tags

  validates :title, :presence => true
  validates :body, :presence => true

  def upvote
    self.votes += 1
  end

  def downvote
    self.votes -= 1
  end
end
