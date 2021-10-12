class CartsController < ApplicationController
before_action :authenticate_user!

    def create
        cart = current_order.cart.new(product_id: params[:product_id])
        if cart.save
            redirect_to root_path, notice: "Has añadido un articulo al carro de compras"
          else
           redirect_to product_path(params[:product_id]), alert: "Error al agregar al carrito"
          end
        end
    end

    private

    def current_order
        order = Order.where(user_id: current_user.id, status: 0).order(updated_at: :desc).first
        Order.create(user_id: current_user.id) unless order
    end

end