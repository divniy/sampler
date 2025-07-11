class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.confirm_email.subject
  #
  def confirm_email
    user = params[:user]
    @greeting = "Hi #{user.email_address}"

    mail to: user.email_address
  end
end
