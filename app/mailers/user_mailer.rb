class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #

  layout "mailer"

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end
end
