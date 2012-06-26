class UserMailer < ActionMailer::Base
  default from: "Myself@markison.com"
  def registration_confirmation(user)
    @user = user
    mail(to:"#{user.name} <#{user.email}>", subject:"Registered")
  end
end

UserMailer.smtp_settings[:user_name]= "info@gymlogistics.com"

