class Basket < ApplicationRecord
  belongs_to :product
  belongs_to :order

  before_create :set_total_value
  before_update :set_total_value
  def set_total_value
    self.total_price = self.unit_price * self.quantity
  end
end
