class UserMailer < ApplicationMailer
  default from: 'reply@jungle.com'

  def welcome_email(user)
    @user = user
    @url = '/login'
    mail(to: @user.email, subject: "Welcome")
end
