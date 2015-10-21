class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  validates :response, :presence => true
  after_create :send_notification_email

  def upvote
    self.votes += 1
  end

  def downvote
    self.votes -= 1
  end

  def send_notification_email

    UserMailer.notification_mailer(self.question.user, self.question).deliver_now
    question = self.question
    user = question.user
  end
end
