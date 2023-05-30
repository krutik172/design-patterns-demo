class ProductQuery
    def call
        Product.where(status: "Sold").where('price > ?', 10000)
    end

    def user_products(user)
        user.payments.includes(:product).map {|prod| prod.product if prod.product.status.eql? "Sold" }
    end
end
