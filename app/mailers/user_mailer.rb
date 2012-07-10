class UserMailer < ActionMailer::Base
  add_template_helper(ApplicationHelper)
  default from: "Myself@markison.com"
  def registration_confirmation(user)
    @user = user
    mail(to:"#{user.name} <#{user.email}>", subject:"Registered")
  end
end
