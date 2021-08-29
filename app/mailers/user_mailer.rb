class UserMailer < ApplicationMailer
  def welcome_email(email, name)
    @user = name
    # byebug
    mail(to: email, subject: 'とりちゃんへようこそ')
  end

end
