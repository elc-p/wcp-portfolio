class UserMailer < ApplicationMailer
  def welcome_email(email, name)
    @user = name
    mail(to: email, subject: 'とりちゃんへようこそ')
  end

end
