class ProductPurchase
    include Interactor 

    def call
        product = Product.find(context.product_id)
        payment = context.current_user.payments.create(product_id: context.product_id, amount: product.price)
        product.status = :Sold
        product.save!
        product.notifyUser(product)
        context.product = product
        context.payment = payment
    end

end
