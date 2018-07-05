class Basket < ApplicationRecord
  belongs_to :product
  belongs_to :order

  before_save :set_total_value

  after_save :set_order_price

  def set_total_value
    self.total_price = self.unit_price * self.quantity
  end

  def set_order_price
    linked_order = Order.find_by(id: self.order_id)
    linked_order.update_price
    linked_order.save
  end
end
