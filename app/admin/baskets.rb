ActiveAdmin.register Basket do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :id, :product_id, :quantity, :unit_price, :order_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
#
form do |f|
    f.inputs "Basket" do
      f.input :quantity
      f.input :unit_price
      f.input :product
      f.input :order
    end
    f.button :Submit
end

end
