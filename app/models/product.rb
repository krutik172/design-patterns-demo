class Product < ApplicationRecord
    belongs_to :user
    has_one :payment
    validates :product_name, presence: true, uniqueness: {case_sensitive: false}
    validates :price, presence: true
    after_create :notify_subscribers
    # delegate :amount, to: :payment
    delegate_missing_to :payment

    before_create do
        self.status ||= 'Available'
    end
    enum status: %i[Available Sold Out_of_stock]
    
    def notifyUser(product)
        policy = ProductPolicy.new(product)

        if policy.hasEmail?
            UserMailer.notification_email(product.user).deliver_now
        end
    end

    def product_amount
        payment.amount
    end

    def notify_subscribers
        UserMailer.new_product(self).deliver_now
    end
end
