require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get add_product" do
    get orders_add_product_url
    assert_response :success
  end

end
