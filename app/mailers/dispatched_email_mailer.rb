class DispatchedEmailMailer < ApplicationMailer

  def inquire_confirmation(dispatched_email)
    @dispatched_email = dispatched_email
    mail(to: dispatched_email.sender_email,
    bcc: ['Ryan <ryan@ooftypop.com>',
       'Kevin <kevin@ooftypop.com>',
        'Paul <paul@ooftypop.com'])
  end
  #
  #
  # def receive(email)
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
