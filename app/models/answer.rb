class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  validates :response, :presence => true

  def upvote
    self.votes += 1
  end

  def downvote
    self.votes -= 1
  end
end
