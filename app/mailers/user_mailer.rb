class UserMailer < ApplicationMailer
    def notification_email(user)
        @user = user
        mail(to: @user.email, subject: 'Notification')
    end
end
