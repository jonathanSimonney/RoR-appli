class Order < ApplicationRecord
  belongs_to :user
  has_many :basket

  def update_price
    price = 0
    self.basket.each do |single_basket|
      price += single_basket.total_price
    end
    self.price = price
  end
end
