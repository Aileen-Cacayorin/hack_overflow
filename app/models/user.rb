class User < ActiveRecord::Base
  has_secure_password
  has_many :questions


  # validates_uniqueness_of :email, :username

  after_create :send_confirmation_email

  def send_confirmation_email
    UserMailer.signup_confirmation(self).deliver_now
  end




end
