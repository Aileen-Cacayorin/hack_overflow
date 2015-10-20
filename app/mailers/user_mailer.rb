class UserMailer < ApplicationMailer
  default from: "hackoverflow@test.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user
    @greeting = "Thank you for joining Hack Overflow. We hope you'll be able to find answers to all your questions. Remember to contribute by answering other user questions!"

    mail to: user.email, subject: "Welcome to Hack Overflow!"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notification_mailer.subject
  #
  def notification_mailer
    @greeting = "Hi"

    mail to: user.email, subject: "Welcome to Hack Overflow!"
  end
end
