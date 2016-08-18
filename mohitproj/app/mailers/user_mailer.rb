class UserMailer < ApplicationMailer
  def assign_website(user)
    @user = user
    @website = user.website
    mail(to: @user.email, subject: 'Random website assigned')
  end
end
