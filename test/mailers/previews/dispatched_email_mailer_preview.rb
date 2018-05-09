# Preview all emails at http://localhost:3000/rails/mailers/dispatched_email_mailer
class DispatchedEmailMailerPreview < ActionMailer::Preview

# Preview all emails at http://localhost:3000/rails/mailers/dispatched_email_mailer/r/inquire_confirmation
  def inquire_confirmation
    sender = DispatchedEmail.last
    DispatchedEmailMailer.inquire_confirmation(sender)
  end

# Preview all emails at http://localhost:3000/rails/mailers/dispatched_email_mailer//receive
  # def receive
  #   page = Page.find_by(address: email.to.first)
  #   page.emails.create(
  #   subject: email.subject,
  #   body: email.body
  #   )
  #
  #     if email.has_attachments?
  #       email.attachments.each do |attachment|
  #       page.attachments.create({
  #       file: attachment,
  #       description: email.subject
  #       })
  #     end
  #   end
  # end
end
