# Preview all emails at http://localhost:3000/rails/mailers/support_request_mailer
class SupportRequestMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/support_request_mailer/respond
  def respond
    SupportRequestMailer.respond
  end

end
