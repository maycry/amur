ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "urattatta",
  :password             => "combi1988",
  :authentication       => "plain",
  :enable_starttls_auto => true
}