class UserMailer < ActionMailer::Base
  default from: "do_not_reply@example.com"
  def contact_email(contact)
    @contact = contact
    mail(to: @contact.email, from: @contact.email, :subject => "Website Contact")
  end
end
