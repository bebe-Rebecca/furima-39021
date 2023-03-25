class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_shipping_address = PurchaseShippingAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_shipping_address = PurchaseShippingAddress.new(purchase_params)
    if @purchase_shipping_address.valid?
      @purchase_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end
  

  private

  def purchase_params
    params.require(:purchase_shipping_address).permit(:postal_code, :origin_to_prefecture_id, :city, :address_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
