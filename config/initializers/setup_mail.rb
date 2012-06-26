ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: "gymlogistics",
  user_name: "webmaster@gymlogistics.com",
  password: "dillonhall21",
  enable_starttls_auto: true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000" if Rails.env.development?
ActionMailer::Base.default_url_options[:host] = "blooming-sunset-1289.herokuapp.com" if Rails.env.production?
ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?

