ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: "u.northwestern.edu",
  user_name: "markison2007@u.northwestern.edu",
  password: "futebol6",
  enable_starttls_auto: true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000" if Rails.env.development?
ActionMailer::Base.default_url_options[:host] = "blooming-sunset-1289.herokuapp.com" if Rails.env.production?

require 'development_mail_interceptor'
Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?

