class OrdersController < ApplicationController
  def add_product
    product = Product.find_by(id: params[:product][:id])
    order = Order.find_by(user_id: current_user.id, paid: false)
    if order == nil
      create_new_order(product)
    else
      update_existing_order(order, product)
    end

    redirect_back fallback_location: product
  end

  private
    def create_new_order(product)
      order = Order.new(user_id: current_user.id, paid: false, price: 0, status: "en attente")
      order.save
      basket = Basket.new(product_id: product.id, quantity: 1, unit_price: product.price, order_id: order.id)
      basket.save
    end

    def update_existing_order(order, product)
      basket = Basket.find_by(order_id: order.id, product_id: product.id)
      if basket == nil
        basket = Basket.new(product_id: product.id, quantity: 1, unit_price: product.price, order_id: order.id)
      else
        basket.quantity+=1
      end
      basket.save
    end
end
