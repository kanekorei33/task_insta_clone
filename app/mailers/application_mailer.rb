class ApplicationMailer < ActionMailer::Base
  default from: 'kanekorei33@gmail.com'
  layout 'mailer'

  def contact_mail(contact)
    @contact = contact

    mail to: @contact.user.email, subject: "記事を投稿しました"
  end
end
