class UserMailer < ApplicationMailer
  default from: 'admin@99cats.com'

  def welcome_email(user)
    @user = user
    @url = 'localhost:3000/cats'

    mail(to: @user.username, subject: 'Welcome to 99Cats!')
  end
end
