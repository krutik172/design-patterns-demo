class UserMailer < ApplicationMailer
    def notification_email(user)
        @user = user
        mail(to: @user.email, subject: 'Notification')
    end

    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome User')
    end

    def new_product(product)
        @product = product
        mail(to: User.pluck(:email), subject: 'New Product Created')
    end

    def invoice_email(user,invoice)
        @user = user
        mail(to: @user.email, subject: 'Invoice', body: invoice)
    end
end
