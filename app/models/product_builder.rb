class ProductBuilder
    def initialize
      @product = Product.new
    end
  
    def with_name(name)
      @product.product_name = name
      self
    end
  
    def with_price(price)
      @product.price = price
      self
    end
  
    def with_user(user)
      @product.user = user
      self
    end
  
    def build
      @product.save!
      @product
    end
end