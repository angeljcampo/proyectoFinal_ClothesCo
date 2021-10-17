class CartsController < ApplicationController
before_action :authenticate_user!
before_action :set_cart, only: [:destroy]
    def update
        product = params[:cart][:product_id]
        quantity = params[:cart][:quantity]
        
        current_order.add_product(product, quantity)
        redirect_to root_url, notice: "Has agregado el producto al carrito de compras"
    end

    def show
        @order = current_order
    end

    def destroy
        @cart.destroy
        respond_to do |format|
          format.html { redirect_to cart_url, notice: "Your cart is now updated." }
          format.json { head :no_content }
        end
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        
        def set_cart
          @cart = Cart.find(params[:id])
        end

end