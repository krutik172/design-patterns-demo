class ProductDecorator
    def initialize(product)
      @product = product
    end
    
    def name
      @product.product_name
    end
    
    def price(currency)
      case currency
      when :usd
        @product.price / 82.12
      when :eur
        @product.price / 89.39
      end
    end
end