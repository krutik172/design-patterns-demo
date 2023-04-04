class ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:query].present?
      @products = Product.where("product_name LIKE ?", "%#{params[:query].capitalize}%")
    else
      @products = Product.all
    end
  end

    def show
      @product = Product.find(params[:id])
    end

    def new
      @product = Product.new
    end

    def create
      @product = current_user.products.create(product_params)
  
      if @product.save
        redirect_to root_url
      else
        flash[:error] = "Could not create product"
      end
    end

    def checkout
      @product = Product.find(params[:id])
      StripeChargeService.new(charges_params, current_user, @product, view_context).call
      redirect_to StripeChargeService.new(charges_params, current_user, @product, view_context).call.url
    end

    def edit
      @product = Product.find(params[:id])
    end

    def update
      @product = Product.find(params[:id])

      if @product.update(product_params)
        redirect_to @product
      else
        render :edit
      end
    end

    def user_products
      @products = ProductQuery.new.user_products(current_user)
    end

    def my_products
      
    end

    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to root_url
    end

    def stripe_success
      @product = Product.find(params[:id])
      @payment = current_user.payment.create(product_id: params[:id], amount: @product.price)
      @product.status = :Sold
      @product.save!
      @product.notifyUser(@product)
      redirect_to product_path(@product), notice: "Purchase Successful"
    end

    def stripe_cancel
      @product = Product.find(params[:id])
      redirect_to product_path(@product), notice: "Purchase Unsuccessful, You cancelled"
    end

    private

    def charges_params
      params.permit(:stripe_email, :stripe_token, :id, :price)
    end

    def product_params
      params.require(:product).permit(:product_name, :price, :user_id)
    end

end
