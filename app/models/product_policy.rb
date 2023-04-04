class ProductPolicy
    def initialize(product)
       @product = product
    end

    def hasEmail?
        product.user.email?
    end

    def hasPrice?
        product.price?
    end

    private
    attr_reader :product
end
